class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :flower_subscriptions, dependent: :destroy
  has_many :suppliers, dependent: :destroy
  has_many :orders, through: :flower_subscriptions, dependent: :destroy
  # validates :name, :address, :zipcode, :role, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

# this added for the mailing
after_create :send_welcome_email
after_create :welcome
private
  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end

def welcome
  user = User.first
   # This is how you pass value to params[:user] inside mailer definition!
   UserMailer.with(user: user).welcome.deliver_now

  end

  #   after_send_welcome_email :subscribe_to_newsletter

  # def subscribe_to_newsletter
  #   SubscribeToNewsletterService.new(self).call
  # end

end
