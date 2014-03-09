class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :routeuuid
      t.string :short_name
      t.string :long_name
      t.integer :type

      t.timestamps
    end
  end
end
