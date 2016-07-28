puts "** Fan out"
jobs = Channel(Int32).new(10)
results = Channel(Int32).new(10)

(1..3).each do |w|
  spawn worker(w, jobs, results)
end

(1..9).each do |j|
  jobs.send j
end

jobs.close

(1..9).each do
  puts results.receive
end

def worker(id, jobs, results)
  while j = jobs.receive?
    puts "worker #{id} processing job #{j}"
    sleep 1
    results.send j*2
  end
end
