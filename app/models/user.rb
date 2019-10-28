class User < ApplicationRecord
  has_many :payments
  has_many :messages
  has_many :reviews
  has_one :tutor
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
