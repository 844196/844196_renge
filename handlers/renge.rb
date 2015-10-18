require 'ruboty/cron'
require 'time'

module Ruboty::Handlers
  class Renge < Base
    on /talk(?:.*)\z/i, name: 'talk', description: 'talk renge'
    on /say(?:.*)\z/i, name: 'say', description: 'say renge'

    def initialize(*args)
      super
      task = {body: '844196_renge say', id: 0, schedule: '0,30 * * * *'}
      jobs = robot.brain.data['cron'] ||= {}
      job = Ruboty::Cron::Job.new(task)
      jobs[job.id] = job.to_hash
      job.start(robot)
    end

    def say(message)
      Ruboty.logger.info("Schedule event: say: #{Time.now}")
      message.reply(`renge`)
    end

    def talk(message)
      unless message.original[:retweeted]
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
end
