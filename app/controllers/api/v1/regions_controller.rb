class Api::V1::RegionsController < ApplicationController
  before_action :set_api_v1_region, only: [ :show, :update, :destroy ]
  before_action :authenticate_user!, only: [ :create, :update, :destroy ]
  before_action :authorize_admin, only: [ :create, :update, :destroy ]

  # GET /api/v1/regions
  def index
    @regions = Region.all

    render json: @regions
  end

  # GET /api/v1/regions/1
  def show
    render json: RegionSerializer.new(@region, include: [ :boulders ])
  end

  # POST /api/v1/regions
  def create
    @region = Region.new(api_v1_region_params)

    if @region.save
      render json: @region, status: :created
    else
      render json: @region.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/regions/1
  def update
    if @region.update(api_v1_region_params)
      render json: @region
    else
      render json: @region.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/regions/1
  def destroy
    @region.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_region
      @region = Region.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_region_params
      params.require(:region).permit(:name, :country_id)
    end

    # Check if current_user has assigned role 'admin'
    def authorize_admin
      render json: { error: "You need to sign in as admin before continuing." }, status: :unauthorized unless current_user.admin?
    end
end
