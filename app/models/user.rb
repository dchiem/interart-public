class User < ActiveRecord::Base
  has_many :pieces
  has_many :comments
  def commented_pieces
    pieces = {}
    comments.each do |c|
      pieces[c.piece] = 1
    end
    return pieces.keys
  end
end
