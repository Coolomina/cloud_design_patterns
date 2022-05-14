require 'net/http'

def get(host, path, retries = 3)
  puts "Trying call to #{host}#{path}..."
  c = Net::HTTP.new(host)

  response = c.request_get(path)
rescue StandardError => e
  puts "Retrying!"
  if retries <= 1
    raise
  end
  get(host, path, retries - 1)
end

get("pis.coolomina.dev", "/index.html")
