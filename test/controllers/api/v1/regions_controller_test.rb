require "test_helper"

class Api::V1::RegionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_region = api_v1_regions(:one)
  end

  test "should get index" do
    get api_v1_regions_url, as: :json
    assert_response :success
  end

  test "should create api_v1_region" do
    assert_difference("Api::V1::Region.count") do
      post api_v1_regions_url, params: { api_v1_region: {} }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_region" do
    get api_v1_region_url(@api_v1_region), as: :json
    assert_response :success
  end

  test "should update api_v1_region" do
    patch api_v1_region_url(@api_v1_region), params: { api_v1_region: {} }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_region" do
    assert_difference("Api::V1::Region.count", -1) do
      delete api_v1_region_url(@api_v1_region), as: :json
    end

    assert_response :no_content
  end
end
