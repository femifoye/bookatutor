class DropMessageFromColumnFromMessageTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :messages, :message_from
  end
end
