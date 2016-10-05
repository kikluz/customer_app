require 'rest-client'

class ItemsController < ApplicationController
  def index
    location = get_squareup_location
    @items = get_squareup_items(location['id'])
  end

  private

    def get_squareup_location
      headers = {:Authorization => SQUAREUP_CONFIG['auth'], accept: :json}
      response = RestClient.get "https://connect.squareup.com/v2/locations", headers
      return JSON.parse(response)['locations'].first
    end

    def get_squareup_items(location_id)
      begin
        headers = {:Authorization => SQUAREUP_CONFIG['auth'], accept: :json}
        response = RestClient.get "https://connect.squareup.com/v1/#{location_id}/items", headers
        return JSON.parse(response)
      rescue => e
        Rails.logger.error e.inspect
        raise
      end

    end
end
