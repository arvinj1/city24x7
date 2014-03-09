class CreateDesttimes < ActiveRecord::Migration
  def change
    create_table :desttimes do |t|
      t.integer :trip_id
      t.string :arrival
      t.string :departure
      t.integer :rail_stop_id
      t.integer :sequence
      t.string :headsign

      t.timestamps
    end
  end
end
