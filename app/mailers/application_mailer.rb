class ApplicationMailer < ActionMailer::Base
  default from: 'flovelle-dutch@gmail.com'
  layout 'mailer'



def welcome(user)
    @user = user # Instance variable => available in view
    mail(to: @user.email, subject: 'Welcome to Flovelle')
        # This will render a view in `app/views/user_mailer`!
  end

end
