
puts "** Fan in"
chIn = Channel(Int32).new
chOut = Channel(Int32).new
spawn producer(chIn, 100.milliseconds)
spawn producer(chIn, 250.milliseconds)
spawn reader(chOut)
(1..20).each do
  chOut.send(chIn.receive)
end
puts

def producer(ch, time)
  (1..10).each do |i|
    ch.send i
    sleep time
  end
end

def reader(ch)
  (1..20).each do
    puts ch.receive
  end
end
