class AddDescriptionAdnDesiredFeedbackToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :desired_feedback, :text
    add_column :pieces, :description, :text
  end
end
