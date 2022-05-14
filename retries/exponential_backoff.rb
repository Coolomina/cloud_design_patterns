require 'net/http'

def fibonacci(n)
  return n if (0..1).include? n
  (fibonacci(n - 1) + fibonacci(n - 2))
end

def get(host, path, retries = 3, backoff = 2)
  puts "Trying call to #{host}#{path}..."
  c = Net::HTTP.new(host)

  response = c.request_get(path)
rescue StandardError => e
  puts "Waiting #{backoff} seconds"
  sleep backoff
  puts "Retrying!"
  if retries <= 1
    raise
  end

  get(host, path, retries - 1, fibonacci(backoff + 2))
end

get("pis.coolomina.dev", "/index.html")