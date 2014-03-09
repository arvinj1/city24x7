class AddDescToFeedEntry < ActiveRecord::Migration
  def change
    add_column :feed_entries, :desc, :string
  end
end
