class OrderItem < ApplicationRecord
  # belongs_to :product
  belongs_to :order

  has_many :variants, dependent: :destroy
end
