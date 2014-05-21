class AddViewCountToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :view_count, :integer
  end
end
