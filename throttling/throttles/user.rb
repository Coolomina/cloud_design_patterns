require 'rack/throttle'

class Rack::Throttle::PremiumUser < Rack::Throttle::Second

  @@default_throttle = 1
  @@premium_throttle = 5

  def max_per_second(request = nil)
    return @@premium_throttle if is_premium_user(request)
   
    @@default_throttle
  end
  alias_method :max_per_window, :max_per_second

  private

  def is_premium_user(request = nil)
    header = request.get_header('HTTP_X_PREMIUM')
    
    header == 'true'
  end
end
