class PieceLike < ActiveRecord::Base
  belongs_to :user
  belongs_to :piece
end
