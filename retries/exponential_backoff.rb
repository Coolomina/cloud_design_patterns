require 'net/http'

def get(host, path, retries = 3, backoff = 2)
  c = Net::HTTP.new(host)

  puts "INFO -- Trying http://#{host}#{path}"
  response = c.request_get(path)
rescue StandardError => e
  puts "ERROR -- Error caught (#{e.class})"
  wait_time_in_seconds = 2**backoff
  puts "INFO -- Waiting #{wait_time_in_seconds} seconds before retrying"
  sleep wait_time_in_seconds
  if retries <= 1
    raise
  end
  
  get(host, path, retries - 1, backoff + 1)
end

get("error-generating.domain", "/")