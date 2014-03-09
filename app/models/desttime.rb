class Desttime < ActiveRecord::Base
  belongs_to :trip
  belongs_to :rail_stop
  
  def self.update_from_gfs(gfs)
    @source = GTFS::Source.build(gfs,{strict: false})
    createTimes
  end
  
  def self.createTimes
    @source.each_stop_time { |entry|
      #unless exists? :tripuuid => entry.id 
        trip=Trip.where("tripuuid=?",entry.trip_id).first
        tripid=trip.id
        stop= RailStop.where("railstopuid=?",entry.stop_id).first
        stopid=stop.id
        create!(
        :trip_id => tripid,
        :rail_stop_id => stopid,
        :arrival => entry.arrival_time,
        :departure => entry.departure_time,
        
          :headsign      => entry.stop_headsign,
          :sequence          => entry.stop_sequence
        )
        #end
    }
  end
end
