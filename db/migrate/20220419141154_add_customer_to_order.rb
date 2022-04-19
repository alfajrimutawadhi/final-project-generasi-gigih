class AddCustomerToOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :customer, null: false, foreign_key: true
  end
end
