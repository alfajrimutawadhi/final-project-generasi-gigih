class AddOrderAndItemToOrderDetail < ActiveRecord::Migration[7.0]
  def change
    add_reference :order_details, :order, null: false, foreign_key: true
    add_reference :order_details, :item, null: false, foreign_key: true
  end
end
