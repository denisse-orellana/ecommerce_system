class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders

  has_many :user_coupons
  has_many :coupons, through: :user_coupons, dependent: :destroy
  has_many :orders, through: :user_coupons, dependent: :destroy

  validates :email, presence: true, uniqueness: :true, allow_blank: false, allow_nil: false
end
