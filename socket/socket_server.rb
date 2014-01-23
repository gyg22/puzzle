require 'socket'

socket_server = TCPServer.new 8080
loop do
  # Wait for a client to connect 
  client = socket_server.accept
  p '--------------------'
  p client
  client.puts 'hello'
  client.puts "Time now is #{Time.now}"
  client.close
end
