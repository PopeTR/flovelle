class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :fsubscriptions
  has_many :suppliers
  has_many :orders, through: :fsubscriptions
  # validates :name, :address, :zipcode, :role, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
