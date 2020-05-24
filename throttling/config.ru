require './server'
require_relative 'throttles/user'

use Rack::Throttle::PremiumUser

run Sinatra::Application
