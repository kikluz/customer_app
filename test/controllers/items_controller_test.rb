require 'test_helper'

class ItemsControllerTest < ActionController::TestCase

  test "should get index" do

    # stub
    @controller.stubs(:get_squareup_location).returns({"id" => '1234'})
    @controller.stubs(:get_squareup_items).returns([
      {
        "id": "442d1344-6d2b-4238-83d0-0284dfd335d8",
        "name": "Milkshake",
        "description": "It's better than yours",
        "visibility": "PRIVATE",
        "type": "NORMAL",
        "available_online": false,
        "category": {
          "id": "36ac7016-3a4e-4934-81f1-9057ac613f2y",
          "name": "Beverages"
        },
        "variations": [
          {
            "id": "cb890728-cfdc-4690-9e03-349f964f756r",
            "name": "Small",
            "pricing_type": "FIXED_PRICING",
            "price_money": {
              "currency_code": "USD",
              "amount": 400
            },
            "ordinal": 0,
            "item_id": "442d1344-6d2b-4238-83d0-0284dfd335d8"
          }
        ]
      }
    ])

    get :index
    assert_response :success

    # set items?
    refute_nil assigns(:items)
  end

end
