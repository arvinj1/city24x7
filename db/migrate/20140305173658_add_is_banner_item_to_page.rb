class AddIsBannerItemToPage < ActiveRecord::Migration
  def change
    add_column :pages, :is_banner_item, :boolean
  end
end
