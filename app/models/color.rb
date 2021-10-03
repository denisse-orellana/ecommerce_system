class Color < ApplicationRecord
    has_many :variants
    has_many :products, through: :variants, dependent: :destroy
end
