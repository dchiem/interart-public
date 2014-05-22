class User < ActiveRecord::Base
  has_many :pieces
  has_many :comments
  has_many :piece_likes

  def commented_pieces
    pieces = {}
    comments.each do |c|
      pieces[c.piece] = 1
    end
    return pieces.keys
  end

  def liked_pieces
    pieces = {}
    piece_likes.each do |pl|
      pieces[Piece.find(pl.piece_id)] = true
    end
    return pieces.keys()
  end
end
