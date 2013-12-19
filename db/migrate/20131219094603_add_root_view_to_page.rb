class AddRootViewToPage < ActiveRecord::Migration
  def change
    add_column :pages, :isrootview, :boolean
  end
end
