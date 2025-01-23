require "rails_helper"

RSpec.describe "Countries", type: :request do
  before do
    @user = User.create(name: "Marek", surname: "Example", email: "user@boulderingtrackerapi.app", password: "password")
    @admin = User.create(name: "Marek", surname: "Example", email: "admin@boulderingtrackerapi.app", password: "password")
    @admin.roles.build(name: "admin")
    @admin.save
  end

  # Anonymous (not logged-in) user shouldn't be able to create new Country record
  # So we expect 401 http status code reponse
  scenario "POST /api/v1/countries - unauthenitcated" do
      post api_v1_countries_path, params: '{"country":{"name":"Switzerland"}}'
      expect(response).to have_http_status(:unauthorized)
    end

  # User without admin role shouldn't be able to create new Country record
  # So we expect 401 http status code reponse
  scenario "POST /api/v1/countries - user" do
    post api_v1_countries_path, params: '{"country":{"name":"Switzerland"}}', headers: provide_auth_headers(@user)
    expect(response).to have_http_status(:unauthorized)
  end

  # User with admin role should be able to create new Country record
  # So we expect 201 http status code response with name attribute matching the payload
  scenario "POST /api/v1/countries - admin" do
    post api_v1_countries_path, params: '{"country":{"name":"Switzerland"}}', headers: provide_auth_headers(@admin)
    expect(response).to have_http_status(:created)
    country = JSON.parse(response.body)
    expect(country["name"]).to eq("Switzerland")
  end
  end
