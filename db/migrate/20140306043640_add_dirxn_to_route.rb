class AddDirxnToRoute < ActiveRecord::Migration
  def change
    add_column :routes, :dirxn, :integer
  end
end
