require 'sinatra'
require "sinatra/reloader" if development?
require 'json'
set :bind, '0.0.0.0'

get '/' do
  response = {
    'message' => "The store is healthy!"
  }

  response.to_json
end
