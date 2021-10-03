class UserCoupon < ApplicationRecord
  belongs_to :user
  belongs_to :coupon
  belongs_to :order

  validates :user_id, presence: true, uniqueness: :true, allow_blank: false, allow_nil: false
  validates :coupon_id, presence: true, uniqueness: :true, allow_blank: false, allow_nil: false
  validates :order_id, presence: true, uniqueness: :true, allow_blank: false, allow_nil: false
  validates :active, presence: true, uniqueness: :true, allow_blank: false, allow_nil: false
end
