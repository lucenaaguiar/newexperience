class AddLocationRefToGuides < ActiveRecord::Migration[5.0]
  def change
    add_reference :guides, :location, foreign_key: true
  end
end
