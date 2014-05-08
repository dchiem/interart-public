class CreatePieceVersions < ActiveRecord::Migration
  def change
    create_table :piece_versions do |t|
      t.integer :piece_id
      t.integer :version

      t.timestamps
    end
  end
end
