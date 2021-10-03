class UserCoupon < ApplicationRecord
  belongs_to :user
  belongs_to :coupon
  belongs_to :order
end
