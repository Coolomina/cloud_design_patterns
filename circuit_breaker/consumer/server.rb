require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'client'
require 'logger'

set :bind, '0.0.0.0'

get '/' do
  'Hello world!'
end

get '/store' do
  BackendClient.call
end

