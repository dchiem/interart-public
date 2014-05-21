class CreatePieceLikes < ActiveRecord::Migration
  def change
    create_table :piece_likes do |t|
      t.integer :piece_id
      t.integer :user_id

      t.timestamps
    end
  end
end
