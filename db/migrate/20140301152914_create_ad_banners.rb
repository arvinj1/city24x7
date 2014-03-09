class CreateAdBanners < ActiveRecord::Migration
  def change
    create_table :ad_banners do |t|
      t.string :name
      t.integer :counter
      t.boolean :selected
      t.integer :see

      t.timestamps
    end
  end
end
