require "rails_helper"

RSpec.describe "Countries", type: :request do
  before do
    @user = User.new(name: "Marek", surname: "Example", email: "admin@boulderingtrackerapi.app", password: "password")
    @user.roles.build(name: "Admin")
    @user.save
  end

  scenario "POST /api/v1/countries - unauthenitcated" do
      post api_v1_countries_path, params: { name: "Switzerland" }
      expect(response).to have_http_status(:unauthorized)
    end

    scenario "POST /api/v1/countries - user" do
      post api_v1_countries_path, params: { name: "Switzerland" }
      expect(response).to have_http_status(:unauthorized)
    end

    # TO-DO: Authenticate user & include token in header
    # scenario "POST /api/v1/countries - admin" do
    #   post api_v1_countries_path, params: { name: "Switzerland" }
    #   expect(response).to have_http_status(:created)
    #   country = JSON.parse(response.body)
    #   expect(country["data"]["attributes"]["name"]).to eq("Switzerland")
    # end
  end
