module Cryroutines

  class Hello

    # A simple example of a channel communicating from a fiber
    # https://divan.github.io/posts/go_concurrency_visualize/
    def self.run
      puts "*** hello"
      ch = Channel(Int32).new

      spawn do
        ch.send 42
      end

      puts ch.receive

      puts
    end

  end

end