class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :flower_subscriptions, dependent: :destroy
  has_many :suppliers, dependent: :destroy
  has_many :orders, through: :flower_subscriptions, dependent: :destroy
  # validates :name, :address, :zipcode, :role, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
