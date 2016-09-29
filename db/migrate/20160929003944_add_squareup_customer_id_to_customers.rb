class AddSquareupCustomerIdToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :squareup_customer_id, :string
  end
end
