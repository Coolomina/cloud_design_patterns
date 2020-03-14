require 'sidekiq'

class Worker
  include Sidekiq::Worker

  def perform(name, count)
    puts "#{name} is hard working #{count} times"
  end
end