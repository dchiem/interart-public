class AddEditImageToComments < ActiveRecord::Migration
  def change
    add_attachment :comments, :edit_img
  end
end
