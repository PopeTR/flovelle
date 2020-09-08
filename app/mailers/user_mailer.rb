class UserMailer < ApplicationMailer
  # default from: 'flovelle-dutch@gmail.com'


def welcome(user)
    @user = user # Instance variable => available in view
    mail(to: @user.email, subject: 'Welcome to Flovelle')
        # This will render a view in `app/views/user_mailer`!
  end


#   def welcome_email
#     @user = params[:user]
#     mail(to: @user.email, subject: 'Welcome to Flovelle')
# end



# def welcome_email
#   @user = params[:user]
#   email_with_name = %("#{@user.name}" <#{@user.email}>)
#   mail(to: email_with_name, subject: 'Welcome to Flovelle')
#  #  UserMailer.with(user: User.first).welcome #=> 👌
#  # UserMailer.with(user: User.first, discount: true)
# end

end
