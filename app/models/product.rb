class Product < ApplicationRecord
  has_and_belongs_to_many :categories

  # has_many :order_items
  # has_many :orders, through: :order_items

  has_many :variants
  has_many :colors, through: :variants, dependent: :destroy
  has_many :sizes, through: :variants, dependent: :destroy

  validates :name, presence: true, uniqueness: :true, allow_blank: false, allow_nil: false
  validates :description, presence: true, uniqueness: :true, allow_blank: false, allow_nil: false
  validates :price, presence: true, uniqueness: :true, allow_blank: false, allow_nil: false
  validates :sku, presence: true, uniqueness: :true, allow_blank: false, allow_nil: false
end
