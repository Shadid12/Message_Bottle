class CreateBottles < ActiveRecord::Migration[5.0]
  def change
    create_table :bottles do |t|
      t.integer :creator_id
      t.text :body
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
