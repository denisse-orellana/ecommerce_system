class Category < ApplicationRecord
  has_and_belongs_to_many :products

  has_many :sub_categories, class_name: "Category", foreign_key: "category_id", dependent: :destroy						
  belongs_to :main_category, class_name: "Category", foreign_key: "category_id", optional: true				

  scope :main_category, -> { joins(:sub_categories) }

  validates :name, presence: true, uniqueness: true, allow_blank: false, allow_nil: false
end
