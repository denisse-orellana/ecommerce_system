class Variant < ApplicationRecord
  belongs_to :size
  belongs_to :color
  belongs_to :product

  has_many :order_items
  has_many :orders, through: :order_items

  validates :size_id, presence: true, uniqueness: :true, allow_blank: false, allow_nil: false
  validates :color_id, presence: true, uniqueness: :true, allow_blank: false, allow_nil: false
  validates :product_id, presence: true, uniqueness: :true, allow_blank: false, allow_nil: false
  validates :stock, presence: true, uniqueness: :true, allow_blank: false, allow_nil: false
end
