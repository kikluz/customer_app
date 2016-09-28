require 'rest-client'

class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|

      # save rails customer
      ActiveRecord::Base.transaction do
        if @customer.save

          # taking customer data and posting it to squareup
          create_squareup_customer({
            "given_name": @customer.given_name,
            "family_name": @customer.family_name,
            "email_address": @customer.email_address,
            "phone_number": @customer.phone_number,
            "address": {
              "address_line_1": @customer.address_line_1,
              "address_line_2": @customer.address_line_2,
              "locality": '',
              "administrative_district_level_1": '',
              "postal_code": @customer.postal_code,
              "country": @customer.country
            },
            "reference_id": '',
            "note": ''
          })

          format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
          format.json { render :show, status: :created, location: @customer }
        else
          format.html { render :new }
          format.json { render json: @customer.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:given_name, :family_name, :email_address, :address, :address_line_1, :address_line_2, :locality, :administrative_district_level_1, :postal_code, :country, :phone_number, :reference_id, :note)
    end

    def create_squareup_customer(customer_hash)
      begin
        headers = {:Authorization => SQUAREUP_CONFIG['auth'], accept: :json}
        result = RestClient.post 'https://connect.squareup.com/v2/customers', customer_hash.to_json, headers
        return result
      rescue => e
        Rails.logger.error e.inspect
        raise
      end

    end
end
