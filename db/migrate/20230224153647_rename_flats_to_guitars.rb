class RenameFlatsToGuitars < ActiveRecord::Migration[7.0]
  def change
    rename_table :flats, :guitars
  end
end
