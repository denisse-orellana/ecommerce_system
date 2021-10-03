class Coupon < ApplicationRecord
    has_many :user_coupons
    has_many :users, through: :user_coupons, dependent: :destroy  
    has_many :orders, through: :user_coupons, dependent: :destroy
end
