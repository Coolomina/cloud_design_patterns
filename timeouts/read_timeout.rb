require 'net/http'

def get(host, path)
  c = Net::HTTP.new(host)
  c.open_timeout = 1
  c.read_timeout = 0.1

  response = c.request_get(path)
rescue Net::ReadTimeout => e
  puts "ERROR -- A connection could be opened but #{host} is taking too long to respond. This may mean the server is waiting for a backend response or it's taking too long to process the request"
end

get("server", "/")