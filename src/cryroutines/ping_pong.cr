
# Ping ponging a value between fibers.
# https://divan.github.io/posts/go_concurrency_visualize/
puts "*** Ping Pong"
table = Channel(Int32).new
3.times { spawn player(table) }

table.send 0
sleep 1.second
puts table.receive
puts

def player(table)
  loop {
    ball = table.receive
    ball += 1
    sleep 100.milliseconds
    table.send(ball)
  }
end
