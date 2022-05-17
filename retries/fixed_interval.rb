require 'net/http'

def get(host, path, retries = 3, backoff = 3)
  c = Net::HTTP.new(host)
  
  puts "INFO -- Trying http://#{host}#{path}"
  response = c.request_get(path)
rescue StandardError => e
  puts "ERROR -- Error caught (#{e.class})"
  puts "INFO -- Waiting #{backoff} seconds before retrying"
  sleep backoff
  if retries <= 1
    raise
  end

  get(host, path, retries - 1, backoff)
end

get("error-generating.domain", "/")