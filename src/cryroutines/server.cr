require "socket"


def handler(socket)
  socket.puts "Goodbye!"
  socket.close
end


puts "Server listening on port 5000"
server = TCPServer.new(5000)
loop do
  socket = server.accept
  spawn handler(socket)
end