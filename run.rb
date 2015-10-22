require 'ruboty'

Dir.glob('handlers/**.rb') do |path|
  require_relative path
end
Dotenv.load

max_retry = 5
1.upto(max_retry) do |i|
  begin
    renge = Ruboty::Robot.new
    renge.run
  rescue => e
    action = i == max_retry ? 'shutting down...' : 'rebooting... Wait 5 min.'
    renge.say(body: "Renge is #{action}\nreason: #{e.message}")

    sleep 300 if i != max_retry
  end
end
