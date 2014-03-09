class RailStop < ActiveRecord::Base
  has_many :desttimes
   has_many :trips, :through => :desttimes
   
   def self.update_from_gfs(gfs)
     @source = GTFS::Source.build(gfs,{strict: false})
     createStops
   end
  
   def self.createStops
     @source.each_stop { |entry|
       unless exists? :railstopuid => entry.id 
         create!(
         :railstopuid => entry.id ,
           :name         => entry.name,
           :lat          => entry.lat,
           :long         => entry.lon     
         )
       end
     }
   end
end
