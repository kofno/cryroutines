module Cryroutines

  # This is an example from Go of using a Channel as a queue.
  # This uses a buffered channel, so we can still fetch
  # items from channel, even though it is closed.
  #
  # https://gobyexample.com/range-over-channels
  class GoRange

    def self.run
      puts "** GoRange"
      queue = Channel(String).new(2)
      queue.send "one"
      queue.send "two"
      queue.close

      while item = queue.receive?
        puts item
      end
      puts
    end

  end

end