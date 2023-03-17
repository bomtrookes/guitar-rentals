class RemoveLocationFromGuitar < ActiveRecord::Migration[7.0]
  def change
    remove_column :guitars, :latitude, :float
    remove_column :guitars, :longitude, :float
    remove_column :guitars, :address
  end
end
