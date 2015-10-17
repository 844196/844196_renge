module Ruboty::Handlers
  class Oudon < Base
    on /(?:お?うどん|o?udon)\z/i, name: 'oudon', description: 'Oudon is a traditional noodle cuisine of Japan'

    def oudon(message)
      Ruboty.logger.info("Handle event: oudon: #{message.body}")

      white_list = ['844196', 'hyousikinuko', '2525morimoto', 'sasairc_2', 'Spring26db', 'keep_off07']
      if white_list.include? message.original[:from]
        message.reply("@keep_off07 \u{1F35C}")
      end
    end
  end
end
