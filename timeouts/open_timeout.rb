require 'net/http'

def get(host, path)
  c = Net::HTTP.new(host)
  c.open_timeout = 0.1

  response = c.request_get(path)
rescue Net::OpenTimeout => e
  puts "ERROR -- There was a problem trying to open an http connection with #{host}. This may be due to firewalling being misconfigured somewhere between this host and #{host} or the host being overloaded and dropping requests"
end

get("10.0.0.1", "/")