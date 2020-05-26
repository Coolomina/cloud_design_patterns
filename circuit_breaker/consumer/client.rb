require 'stoplight'
require 'faraday'

class BackendClient
  class << self
    @@light = Stoplight('call') {
      url = "http://#{ENV.fetch('BACKEND_URL')}:4567"
      conn = Faraday::Connection.new(url)
      conn.options.open_timeout = 1
      conn.options.timeout = 2
  
      conn.get(url).body
    }

    def call
      return default_error_msg if circuit_open
      
      @@light.run
    end

    private

    def default_error_msg
      { message: 'We\'re experiencing some problems with our store, please come back later' }.to_json
      # NOTIFY SOMEWHERE!!!
      # Change integration URL?
    end

    def circuit_open
      @@light.color == 'red'
    end
  end
end
