class RemoveColumnsFromFlat < ActiveRecord::Migration[7.0]
  def change
    remove_column :flats, :name, :string
    remove_column :flats, :summary, :text
    remove_column :flats, :description, :text
    remove_column :flats, :guests, :integer
    remove_column :flats, :bedrooms, :integer
    remove_column :flats, :beds, :integer
    remove_column :flats, :bathrooms, :integer
  end
end
