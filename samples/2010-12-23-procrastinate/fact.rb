require 'procrastinate'
include Procrastinate

class Worker
  def fact(n)
    r = 1
    while n>1
      r *= n
      n -= 1
    end
    r
  end
end

scheduler = Scheduler.start(SpawnStrategy::Throttled.new(5))
worker = scheduler.create_proxy(Worker.new)

futures = 10.times.map do |i|
  [i, worker.fact(i)]
end

futures.each do |i, fact_i|
  puts "Factorial(#{i}) == #{fact_i.value}"
end

scheduler.shutdown

