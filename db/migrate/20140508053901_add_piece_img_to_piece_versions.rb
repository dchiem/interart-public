class AddPieceImgToPieceVersions < ActiveRecord::Migration
  def up
    add_attachment :piece_versions, :piece_img
  end

  def down
    remove_attachment :piece_versions, :piece_img
  end
end
