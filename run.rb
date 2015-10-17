require 'ruboty'

Dir.glob('handlers/**.rb') do |path|
  require_relative path
end
Dotenv.load

renge = Ruboty::Robot.new
renge.run
