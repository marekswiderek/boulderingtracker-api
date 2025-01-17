require "test_helper"

class Api::V1::CountriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_country = api_v1_countries(:one)
  end

  test "should get index" do
    get api_v1_countries_url, as: :json
    assert_response :success
  end

  test "should create api_v1_country" do
    assert_difference("Api::V1::Country.count") do
      post api_v1_countries_url, params: { api_v1_country: {} }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_country" do
    get api_v1_country_url(@api_v1_country), as: :json
    assert_response :success
  end

  test "should update api_v1_country" do
    patch api_v1_country_url(@api_v1_country), params: { api_v1_country: {} }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_country" do
    assert_difference("Api::V1::Country.count", -1) do
      delete api_v1_country_url(@api_v1_country), as: :json
    end

    assert_response :no_content
  end
end
