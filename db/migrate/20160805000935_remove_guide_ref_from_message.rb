class RemoveGuideRefFromMessage < ActiveRecord::Migration[5.0]
  def change
    remove_reference :messages, :guide, foreign_key: true
  end
end
