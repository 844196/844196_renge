module Ruboty::Handlers
  class Oudon < Base
    on /(?:お?うどん|o?udon)\z/i, name: 'oudon', description: 'Oudon is a traditional noodle cuisine of Japan'

    def oudon(message)
      is_retweet = lambda {|msg|
        return false if ENV['RUBOTY_ENV'] == 'development'
        msg.original[:robot].memoized_table[:adapter].memoized_table.has_key? :client
      }

      unless is_retweet.(message)
        Ruboty.logger.info("Handle event: oudon: #{message.body}")
        white_list = ['844196',
                      'hyousikinuko',
                      '2525morimoto',
                      'sasairc_2',
                      'Spring26db',
                      'keep_off07']

        message.reply("@keep_off07 \u{1F35C}") if white_list.include? message.original[:from]
      end
    end
  end
end
