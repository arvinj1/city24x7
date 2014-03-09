class CreateRailStops < ActiveRecord::Migration
  def change
    create_table :rail_stops do |t|
      t.string :railstopuid
      t.string :name
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
