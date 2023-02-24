class AddColumnsToFlatsModel < ActiveRecord::Migration[7.0]
  def change
    add_column :flats, :guests, :integer
    add_column :flats, :bedrooms, :integer
    add_column :flats, :beds, :integer
    add_column :flats, :bathrooms, :integer
    add_column :flats, :summary, :text
    add_column :flats, :description, :text
  end
end
