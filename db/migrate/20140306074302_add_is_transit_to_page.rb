class AddIsTransitToPage < ActiveRecord::Migration
  def change
    add_column :pages, :istransit, :boolean
  end
end
