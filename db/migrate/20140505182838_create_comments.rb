class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :piece_id
      t.integer :piece_version_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
