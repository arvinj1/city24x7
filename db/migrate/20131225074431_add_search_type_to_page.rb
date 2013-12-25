class AddSearchTypeToPage < ActiveRecord::Migration
  def change
    add_column :pages, :searchType, :string
  end
end
