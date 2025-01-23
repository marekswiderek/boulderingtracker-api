class Api::V1::BouldersController < ApplicationController
  before_action :set_api_v1_boulder, only: [ :show, :update, :destroy ]
  before_action :authenticate_user!, only: [ :create, :update, :destroy ]
  before_action :authorize_admin, only: [ :create, :update, :destroy ]

  # GET /api/v1/boulders
  def index
    @boulders = Boulder.all

    render json: @boulders.to_json(except: [ :created_at, :updated_at ])
  end

  # GET /api/v1/boulders/1
  def show
    render json: BoulderSerializer.new(@boulder, include: [ :ascents ])
  end

  # POST /api/v1/boulders
  def create
    @boulder = Boulder.new(api_v1_boulder_params)

    if @boulder.save
      render json: @boulder.to_json(except: [ :updated_at ]), status: :created
    else
      render json: @boulder.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/boulders/1
  def update
    if @boulder.update(api_v1_boulder_params)
      render json: @boulder.to_json(except: [ :created_at ])
    else
      render json: @boulder.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/boulders/1
  def destroy
    @boulder.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_boulder
      @boulder = Boulder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_boulder_params
      params.require(:boulder).permit(:name, :grade, :region_id)
    end

    # Check if current_user has assigned role 'admin'
    def authorize_admin
      render json: { error: "You need to sign in as admin before continuing." }, status: :unauthorized unless current_user.admin?
    end
end
