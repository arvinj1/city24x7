class AddSearchableToPage < ActiveRecord::Migration
  def change
    add_column :pages, :searchable, :boolean
    add_column :pages, :keywords, :string
  end
end
