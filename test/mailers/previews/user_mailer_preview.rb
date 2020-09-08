# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
# TESTING MAILER!!!
class UserMailerPreview < ActionMailer::Preview
  # default from: 'flovelle-dutch@gmail.com'

  def welcome
    user = User.first
    # This is how you pass value to params[:user] inside mailer definition!
    UserMailer.welcome(user)
  end
end
