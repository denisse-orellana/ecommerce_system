class Color < ApplicationRecord
    has_many :variants
    has_many :products, through: :variants, dependent: :destroy

    validates :name, presence: true, uniqueness: :true, allow_blank: false, allow_nil: false
end
