class CreateCategoriesPiecesTable < ActiveRecord::Migration
  def change
    create_table :categories_pieces_tables do |t|
      t.integer :category_id
      t.integer :piece_id
      
    end
  end
end
