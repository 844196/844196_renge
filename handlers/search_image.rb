require 'ruboty/google_image'

Ruboty.handlers.delete(Ruboty::Handlers::GoogleImage)

module Ruboty::Handlers
  class SearchImage < Base
    on /image( me)? (?<keyword>.+)/, name: "image2", description: "Search image from Google"

    def image2(message)
      Ruboty.logger.info("Handle event: image2: #{message.body}")

      if str = Ruboty::GoogleImage::Client.new(query: message[:keyword]).get
        message.reply("@#{message.original[:from]} #{str}")
      end
    end
  end
end
