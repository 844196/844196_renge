require 'ruboty'

Dir.glob('handlers/**.rb') do |path|
  require_relative path
end
Dotenv.load

loop do
  begin
    renge = Ruboty::Robot.new
    renge.run
  rescue => e
    renge.say(
      body: "Renge is rebooting... Wait 5 min.\nreason: #{e.message}",
      original: {id: nil, tweet: nil}
    )
  end
  sleep 300
end
