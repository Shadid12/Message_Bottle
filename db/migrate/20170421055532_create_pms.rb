class CreatePms < ActiveRecord::Migration[5.0]
  def change
    create_table :pms do |t|
      t.text :body
      t.integer :sender_id
      t.references :conversation, foreign_key: true

      t.timestamps
    end
  end
end
