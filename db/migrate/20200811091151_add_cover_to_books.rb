class AddCoverToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :cover, :string
    add_column :books, :keywords, :string, array: true, default: []
  end
end
