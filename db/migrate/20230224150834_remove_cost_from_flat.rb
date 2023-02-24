class RemoveCostFromFlat < ActiveRecord::Migration[7.0]
  def change
    remove_column :flats, :cost_per_night, :integer
  end
end
