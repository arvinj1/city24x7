# config/initializers/geocoder.rb

Geocoder::Configuration.lookup= :bing
Geocoder::Configuration.api_key="AkOPDVonv4GRzhl3u1if4IlsLjyYhqH4tTH3J1Y0gkfg6zXP5n1rzBnTjs_fLVYi"
Geocoder::Configuration.timeout=15
Geocoder::Configuration.cache=Rails.cache
