module Ruboty::Handlers
  class Sugoi < Base
    on(
      /.*すごい.*/,
      name: 'sugoi',
      description: 'すごい',
      all: true
    )

    def sugoi(message)
      return nil if message.original[:retweeted]

      from = message.original[:from]
      suffix = ['なー！', '...', ''].sample
      message.reply("@#{from} すごくないのん#{suffix}")
    end
  end
end
