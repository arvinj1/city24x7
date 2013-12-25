module PagesHelper
  def google_places_search (lat , lon) 
    "Will be doing google places search for  #{lat} :  #{lon}"
  end 
  
  def maps_api_key
    "AIzaSyCiIVlMotGTHUdGu-3bNbcbgfOXkkOSYoY"
  end
  
  def google_api_url
    "http://maps.googleapis.com/maps/api/js"
  end
  
  def google_api_access
        "#{google_api_url}?key=#{maps_api_key}&libraries=geometry&sensor=false"
  end
  def google_maps_api
    content_tag(:script,:type => "text/javascript",:src => google_api_access) do
    end
  end
  
  def lat_lng_to_js(lat,lng)
     content_tag(:script, :type => "text/javascript") do
       "var js_lat = "+lat.to_s;
        "var js_lng = "+lng.to_s;
     end
   end
  
end
