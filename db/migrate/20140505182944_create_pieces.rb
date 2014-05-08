class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string :title
      t.string :url
      t.integer :user_id

      t.timestamps
    end
  end
end
