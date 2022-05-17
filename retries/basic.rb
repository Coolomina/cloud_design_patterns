require 'net/http'

def get(host, path, retries = 3)
  c = Net::HTTP.new(host)
  
  puts "INFO -- Trying http://#{host}#{path}"
  response = c.request_get(path)
rescue StandardError => e
  puts "ERROR -- Error caught (#{e.class})"
  if retries <= 1
    raise
  end
  get(host, path, retries - 1)
end

get("error-generating.domain", "/")
