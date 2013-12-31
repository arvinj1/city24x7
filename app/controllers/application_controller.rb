class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :setupCords
  def remoteIP
      if request.remote_ip == '127.0.0.1'
        # Hard coded remote address
        '69.124.17.8'
      else
        request.remote_ip
      end
    end
    def placesClient
      @client = GooglePlaces::Client.new(API_KEY)
    end
    
    def setupCords
      @rip=remoteIP
      @coordinates ||= Geocoder.coordinates(@rip)
    end
end
