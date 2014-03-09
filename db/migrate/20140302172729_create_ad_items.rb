class CreateAdItems < ActiveRecord::Migration
  def change
    create_table :ad_items do |t|
      t.string :name
      t.string :image
      t.boolean :selected
      t.integer :ad_banner_id

      t.timestamps
    end
  end
end
