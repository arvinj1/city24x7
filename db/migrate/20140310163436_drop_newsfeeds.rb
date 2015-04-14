class DropNewsfeeds < ActiveRecord::Migration
  def up
     drop_table :newsfeeds
   end

   def down
     raise ActiveRecord::IrreversibleMigration
   end
end
