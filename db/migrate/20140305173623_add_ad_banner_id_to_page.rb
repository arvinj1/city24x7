class AddAdBannerIdToPage < ActiveRecord::Migration
  def change
    add_column :pages, :ad_banner_id, :integer
  end
end
