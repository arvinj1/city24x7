class AddSecIconToPages < ActiveRecord::Migration
  def change
    add_column :pages, :sec_icon, :string
  end
end
