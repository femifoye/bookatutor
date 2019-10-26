class AddMessageContentToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :message_content, :string
  end
end
