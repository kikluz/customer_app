json.array!(@customers) do |customer|
  json.extract! customer, :id, :given_name, :family_name, :email_address, :address, :address_line_1, :address_line_2, :locality, :administrative_district_level_1, :postal_code, :country, :phone_number, :reference_id, :note
  json.url customer_url(customer, format: :json)
end
