class AddFnameToAdBannerItem < ActiveRecord::Migration
  def change
    add_column :ad_banner_items, :fname, :string
  end
end
