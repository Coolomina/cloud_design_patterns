require 'net/http'

def get(host, path)
  c = Net::HTTP.new(host)
  c.open_timeout = 0.1

  response = c.request_get(path)
rescue StandardError => e
  puts "Error! #{e.class}"
end

get("10.0.0.1", "/")