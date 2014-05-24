class PieceVersion < ActiveRecord::Base
  has_many :comments
  belongs_to :piece
  has_attached_file :piece_img, :styles => {
    square: '800x800>'
  }
  validates_attachment :piece_img, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  def url
    return piece_img.url(:square)
  end
end
