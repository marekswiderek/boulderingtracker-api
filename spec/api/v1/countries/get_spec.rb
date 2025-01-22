require "rails_helper"

RSpec.describe "Countries", type: :request do
  before do
    Country.create([
      { name: "Poland" },
      { name: "Switzerland" },
      { name: "Czech Republic" },
      { name: "Germany" },
      { name: "Spain" }
    ])
  end

  scenario "GET /api/v1/countries" do
    get api_v1_countries_path
    expect(response).to have_http_status(:success)
    countries = JSON.parse(response.body)
    expect(countries.length).to eq(5)
  end
end
