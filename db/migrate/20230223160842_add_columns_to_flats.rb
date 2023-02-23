class AddColumnsToFlats < ActiveRecord::Migration[7.0]
  def change
    add_column :flats, :cost_per_night, :float
  end
end
