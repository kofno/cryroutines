module Cryroutines

  class PingPong

    # Ping ponging a value between fibers.
    # https://divan.github.io/posts/go_concurrency_visualize/
    def self.run(players)
      puts "*** Ping Pong #{players}"
      table = Channel(Int32).new
      players.times { spawn player(table) }

      table.send 0
      sleep 1.second
      puts table.receive
      puts
    end

    def self.player(table)
      loop {
        ball = table.receive
        ball += 1
        sleep 100.milliseconds
        table.send(ball)
      }
    end

  end

end