class RemoveLocationFromGuides < ActiveRecord::Migration[5.0]
  def change
    remove_column :guides, :location, :string
  end
end
