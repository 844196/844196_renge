require 'ruboty'

Dir.glob('handlers/**.rb') do |path|
  require_relative path
end
Dotenv.load

renge = Ruboty::Robot.new

module Ruboty
  class Action
    def self.prefix_pattern(robot_name)
      /^@?#{Regexp.escape(robot_name)}:?\s+/
    end
  end
end

renge.run
