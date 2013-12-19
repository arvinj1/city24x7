class AddMappableToPage < ActiveRecord::Migration
  def change
    add_column :pages, :mappable, :boolean
  end
end
