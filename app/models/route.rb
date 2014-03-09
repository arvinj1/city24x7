class Route < ActiveRecord::Base
  has_many :trips
  self.inheritance_column = nil
  
  def self.update_from_gfs(gfs)
    @source = GTFS::Source.build(gfs,{strict: false})
    createRoutes
  end
  
  def self.createRoutes
    @source.each_route { |entry|
      unless exists? :routeuuid => entry.id 
        create!(
        :routeuuid => entry.id ,
          :short_name         => entry.short_name,
          :long_name      => entry.long_name,
          :dirxn          => entry.type     
        )
      end
    }
  end
end
