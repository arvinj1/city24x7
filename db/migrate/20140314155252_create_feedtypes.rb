class CreateFeedtypes < ActiveRecord::Migration
  def change
    create_table :feedtypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
