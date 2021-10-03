class AddVariantToOrderItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_items, :variant, foreign_key: true
  end
end
