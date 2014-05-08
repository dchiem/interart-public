class Comment < ActiveRecord::Base
  belongs_to :piece
  belongs_to :piece_version
  belongs_to :user
end
