class AddColumnsToGuitar < ActiveRecord::Migration[7.0]
  def change
    add_column :guitars, :name, :string
    add_column :guitars, :caption, :text
    add_column :guitars, :description, :text
    add_column :guitars, :type, :string
    add_column :guitars, :cost_per_day, :integer
  end
end
