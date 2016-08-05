class AddDateTourTextMsgToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :date_tour, :date
    add_column :messages, :text_msg, :text
  end
end
