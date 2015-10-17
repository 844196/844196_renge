require 'n_cipher'

module Ruboty::Handlers
  class ConvertNCipher < Base
    on /(en|de)code\s(.+)\z/i, name: 'convert', description: 'convert string'

    def convert(message)
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
