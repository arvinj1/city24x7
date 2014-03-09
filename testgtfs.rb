require 'rubygems'
require 'gtfs'

class C247Test
  def initialize (filename,loc)
    @gfsfile=filename
    @location=loc
    @source = GTFS::Source.build(filename,{strict: false})
  end
  
  def get
    #@source.each_agency { |agency| puts agency}
    #@source.each_stop { |stop| puts stop}
    #@source.each_trip { |trip| puts trip.id}
    #@source.each_stop_time { |stop| print "#{stop.trip_id},#{stop.arrival_time},#{stop.departure_time},#{stop.stop_id}\n";}
    @source.each_stop_time { |trip| print " #{trip.trip_id},#{trip.stop_id} #{trip.arrival_time}:#{trip.departure_time} #{trip.stop_headsign}/#{trip.stop_sequence} \n"} 
  end
  
  def createRoutes
    @source.each_route { |entry|
      unless exists? :routeuuid => entry.id 
        create!(
          :short_name         => entry.short_name,
          :long_name      => entry.long_name,
          :type          => entry.type
          
        )
      end
    }
  end
end


a=C247Test.new("app/assets/extras/google_transit.zip","New York")
a.get
#a.createRoutes