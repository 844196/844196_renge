module Ruboty::Handlers
  class SystemOperate < Base
    on(
      /op(?:erate|s)? (?<subcommand>.+)\z/i,
      name: 'parser',
      description: 'reply system uptime'
    )

    def parser(message)
      return nil if message.original[:retweeted]

      from = message.original[:from]
      string = if from == '844196'
        "\n".concat case message[:subcommand]
        when 'uptime'
          `uptime`
        when 'order 66'
          fail ''
        end
      else
        '知らない人の言うことは聞いちゃいけないってねーねー言ってたのん'
      end

      message.reply("@#{from} #{string}")
    end
  end
end
