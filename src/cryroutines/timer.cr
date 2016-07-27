module Cryroutines

  class Timer

    # A timer build using fibers and a channel
    # https://divan.github.io/posts/go_concurrency_visualize/
    def self.run
      puts "*** timer"
      (1..10).each do
        ch = timer(1.second)
        print ch.receive
      end
      puts
    end

    def self.timer(time)
      ch = Channel(Int32).new
      spawn do
        sleep time
        ch.send 1
      end
      ch
    end

  end

end