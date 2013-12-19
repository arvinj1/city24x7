class AddImageToPage < ActiveRecord::Migration
  def change
    add_column :pages, :icon, :string
  end
end
