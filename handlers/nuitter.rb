require 'nokogiri'
require 'open-uri'
require 'net/http'

module Ruboty::Handlers
  class Nuitter < Base
    on(
      /nuitter (?<okazu>.+)\z/i,
      name: 'nuitter',
      description: '抜いたことをシェアできる。そう、Nuitterならね。'
    )

    def nuitter(message)
      return nil if message.original[:retweeted]
      from = message.original[:from]

      nuitan = -> o { ".@#{from} が「#{o}」で抜いたん！"}
      msg = if message[:okazu] =~ /\A(?:https?.+|ftp.+)/i
              ero = GetTitle.new(message[:okazu])
              ero.title ? "#{nuitan.(ero.title)} #{ero.url}" : "@#{from} よくわかんなかったん..."
            else
              "#{nuitan.(message[:okazu])}"
            end

      message.reply(
        msg.length > 140 ? msg[0,137] + '...' : msg
      )
    end
  end

  class GetTitle
    attr_accessor :url, :title

    def initialize(url)
      @url   = url
      @title = get_title(url)
    end

    def get_title(url)
      uri   = case url
              when %r(\Ahttps?://t\.co/)
                URI.parse(expand_tco(url))
              else
                URI.parse(url)
              end
      title = Nokogiri::HTML.parse(open(uri.to_s)).title.tap do |t|
        break File.basename(uri.to_s) if t.nil? || t.empty?
      end

      title
    rescue
      nil
    end

    def expand_tco(tco)
      timeout(5) { Net::HTTP.get_response(URI.parse(tco))['location'] }
    rescue
      nil
    end
  end
end
