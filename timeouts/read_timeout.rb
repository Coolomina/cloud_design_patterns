require 'net/http'

def get(host, path)
  c = Net::HTTP.new(host)
  c.open_timeout = 1
  c.read_timeout = 0.1

  response = c.request_get(path)
rescue Net::ReadTimeout => e
  puts "[ERROR] A connection could be opened but #{host} is taking too long to respond. This may mean the server is overloaded with requests. Please look at this dashboard (LINK TO DASHBOARD)"
end

get("server", "/")