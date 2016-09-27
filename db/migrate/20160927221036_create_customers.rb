class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :given_name
      t.string :family_name
      t.string :email_address
      t.string :address
      t.string :address_line_1
      t.string :address_line_2
      t.string :locality
      t.string :administrative_district_level_1
      t.integer :postal_code
      t.string :country
      t.integer :phone_number
      t.integer :reference_id
      t.text :note

      t.timestamps null: false
    end
  end
end
