class RenameGuitarColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :guitars, :type, :guitar_type
  end
end
