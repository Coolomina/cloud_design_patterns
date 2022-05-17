require 'net/http'

def fibonacci(n)
  return n if (0..1).include? n
  (fibonacci(n - 1) + fibonacci(n - 2))
end

def get(host, path, retries = 3, backoff = 4)
  c = Net::HTTP.new(host)
  c.open_timeout = 1
  c.read_timeout = 2

  puts "INFO -- Trying http://#{host}#{path}"
  response = c.request_get(path)
rescue Net::OpenTimeout => e
  puts "ERROR -- There was a problem trying to open an http connection with #{host}. This may be due to firewalling being misconfigured somewhere between this host and #{host} or the host being overloaded and dropping requests"
  if retries <= 1
    # raise
    return
  end
  sleep fibonacci(backoff)

  get(host, path, retries - 1, backoff + 1)
rescue Net::ReadTimeout => e
  puts "ERROR -- A connection could be opened but #{host} is taking too long to respond. This may mean the server is waiting for a backend response or it's taking too long to process the request"
  if retries <= 1
    # raise
    return
  end
  sleep fibonacci(backoff)

  get(host, path, retries - 1, backoff + 1)
end

get("10.0.0.1", "/")
get("server", "/")