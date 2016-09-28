class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :given_name
      t.string :family_name
      t.string :email_address
      t.string :address_line_1
      t.string :address_line_2
      t.string :postal_code
      t.string :country
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
