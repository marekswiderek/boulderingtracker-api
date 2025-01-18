class Api::V1::CountriesController < ApplicationController
  before_action :set_api_v1_country, only: [ :show, :update, :destroy ]
  before_action :authenticate_user!, only: [ :create, :update, :destroy ]
  before_action :authorize_admin, only: [ :create, :update, :destroy ]

  # GET /api/v1/countries
  def index
    @countries = Country.all

    render json: CountrySerializer.new(@countries)
  end

  # GET /api/v1/countries/1
  def show
    render json: CountrySerializer.new(@country)
  end

  # POST /api/v1/countries
  def create
    @country = Country.new(api_v1_country_params)

    if @country.save
      render json: CountrySerializer.new(@country), status: :created, location: @country
    else
      render json: @country.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/countries/1
  def update
    if @country.update(api_v1_country_params)
      render json: CountrySerializer.new(@country)
    else
      render json: @country.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/countries/1
  def destroy
    @country.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_country
      @country = Country.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_country_params
      params.fetch(:api_v1_country, {})
    end

    # Check if current_user has assigned role 'admin'
    def authorize_admin
      render json: { error: "You need to sign in as admin before continuing." }, status: :unauthorized unless current_user.admin?
    end
end
