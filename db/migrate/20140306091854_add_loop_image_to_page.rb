class AddLoopImageToPage < ActiveRecord::Migration
  def change
    add_column :pages, :loopImage, :string
  end
end
