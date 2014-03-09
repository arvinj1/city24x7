class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :route_id
      t.string :service_id
      t.string :tripuuid
      t.string :headsign
      t.integer :direction

      t.timestamps
    end
  end
end
