class Comment < ActiveRecord::Base
  belongs_to :piece
  belongs_to :piece_version
  belongs_to :user
  has_attached_file :edit_img, :styles => {
    square: '400x400>'
  }
  validates_attachment :edit_img, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  def set_image(d)
    StringIO.open(d) do |data|
      data.class.class_eval { attr_accessor :original_filename, :content_type, :edit_img_file_name }
      data.original_filename = "edit.png"
      data.content_type = "image/png"
      self.edit_img = data
    end
    
  end
end
