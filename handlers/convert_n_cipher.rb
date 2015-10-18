require 'n_cipher'

module Ruboty::Handlers
  class ConvertNCipher < Base
    on /(en|de)code\s(.+)\z/i, name: 'convert', description: 'convert string'

    def convert(message)
      is_retweet = lambda {|msg|
        return false if ENV['RUBOTY_ENV'] == 'development'
        msg.original[:robot].memoized_table[:adapter].memoized_table.has_key? :client
      }

      unless is_retweet.(message)
        Ruboty.logger.info("Handle event: convert: #{message.body}")

        to = message.original[:from]
        begin
          str = NCipher.send("#{message[1]}code",message[2].gsub("\uff5e", "\u301c"))
        rescue => e
          str = "さっきから皆変なのん！！ 何言ってるかわからないのん！！（#{e.message}）"
        end

        msg = "@#{to} #{str}"

        message.reply(
          msg.length > 140 ? msg[0,137] + '...' : msg
        )
      end
    end
  end
end
