class AddPieceIdAndTagIdToPiecesTags < ActiveRecord::Migration
  def change
    add_column :pieces_tags, :piece_id, :integer
    add_column :pieces_tags, :tag_id, :integer
  end
end
