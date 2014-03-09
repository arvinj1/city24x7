class AddRsSableToPage < ActiveRecord::Migration
  def change
    add_column :pages, :rssable, :boolean
  end
end
