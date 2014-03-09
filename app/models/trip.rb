class Trip < ActiveRecord::Base
  belongs_to :route 
  has_many :desttimes
  has_many :rail_stops, :through => :desttimes

  def self.update_from_gfs(gfs)
    @source = GTFS::Source.build(gfs,{strict: false})
    createTrips
  end
  
  def self.createTrips
    @source.each_trip { |entry|
      unless exists? :tripuuid => entry.id 
        route=Route.where("routeuuid=?",entry.route_id).first
        routeid=route.id
        create!(
        :tripuuid => entry.id,
        :service_id => entry.service_id,
          :route_id         => routeid,
          :headsign      => entry.headsign,
          :direction          => entry.direction_id 
        )
      end
    }
  end

end
