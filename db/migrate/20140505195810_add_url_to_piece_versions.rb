class AddUrlToPieceVersions < ActiveRecord::Migration
  def change
    add_column :piece_versions, :url, :string
  end
end
