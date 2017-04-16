class AddReciverIdToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :reciever_id, :integer
  end
end
