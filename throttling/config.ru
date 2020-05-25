require './server'
require_relative 'throttles/user'

use Rack::Throttle::PremiumUser # if feature-flag is active

run Sinatra::Application
