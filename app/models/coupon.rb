class Coupon < ApplicationRecord
    has_many :user_coupons
    has_many :users, through: :user_coupons, dependent: :destroy  
    has_many :orders, through: :user_coupons, dependent: :destroy

    validates :name, presence: true, uniqueness: true, allow_blank: false, allow_nil: false
    validates :code, presence: true, uniqueness: true, allow_blank: false, allow_nil: false
    validates :discount, presence: true, uniqueness: true, allow_blank: false, allow_nil: false
end
