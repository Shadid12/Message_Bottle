class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.integer :aid
      t.integer :bid

      t.timestamps
    end
  end
end
