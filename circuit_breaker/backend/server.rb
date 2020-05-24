require 'sinatra'
require "sinatra/reloader" if development?
require 'json'
set :bind, '0.0.0.0'

get '/' do
  response = {
    'message' => "Hoooola desde #{ENV.fetch('SERVICE_NAME')}"
  }

  response.to_json
end
