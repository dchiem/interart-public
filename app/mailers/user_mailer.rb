class UserMailer < ActionMailer::Base
  default from: "interart247@gmail.com"
  def new_comment(user, piece)
    @host = Rails.env == "production" ? "http://interart.heroku.com" : "http://localhost:3000" 
    @piece = piece
    mail(:to => user.email, :subject => "New comment on Interart")
  end

end
