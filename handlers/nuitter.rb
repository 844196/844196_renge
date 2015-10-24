require 'nokogiri'
require 'open-uri'

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
      uri   = URI.parse(url)
      title = Nokogiri::HTML.parse(open(uri.to_s)).title

      if title.nil? or title.empty?
        title = File.basename(uri.to_s)
      end

      title
    rescue
      nil
    end
  end
end
