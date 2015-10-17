module Ruboty::Handlers
  class Renge < Base
    on /talk(?:.*)\z/i, name: 'talk', description: 'talk renge'

    def talk(message)
      Ruboty.logger.info("Handle event: talk: #{message.body}")

      to = message.original[:from]
      str = `renge`

      msg = "@#{to} #{str}"

      message.reply(
        msg.length > 140 ? msg[0,137] + '...' : msg
      )
    end
  end
end
