require "rails_helper"

RSpec.describe "Countries", type: :request do
  before do
    country = Country.new(name: "Poland")
    country.save
    @country_id = country.id
  end

  scenario "GET /api/v1/countries/:id" do
    get api_v1_country_path(@country_id)
    expect(response).to have_http_status(:success)
    country = JSON.parse(response.body)
    expect(country["name"]).to eq("Poland")
  end
end
