require 'socket'

s = TCPSocket.new('127.0.0.1', 8080)
# Read lines from socket, and print them
while line = s.gets
  puts line 
end
# close socket when done
s.close
