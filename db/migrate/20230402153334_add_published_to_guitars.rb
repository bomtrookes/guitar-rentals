class AddPublishedToGuitars < ActiveRecord::Migration[7.0]
  def change
    add_column :guitars, :published, :boolean, default: false
  end
end
