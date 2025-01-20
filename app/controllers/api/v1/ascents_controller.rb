class Api::V1::AscentsController < ApplicationController
  before_action :set_api_v1_ascent, only: [ :show, :update, :destroy ]
  before_action :authenticate_user!, only: [ :create, :update, :destroy ]
  before_action :authorize_user, only: [ :update, :destroy ]

  # GET /api/v1/ascents
  def index
    @ascents = Ascent.all

    render json: @ascents
  end

  # GET /api/v1/ascents/1
  def show
    render json: @ascent
  end

  # POST /api/v1/ascents
  def create
    @ascent = Ascent.new(api_v1_ascent_params)

    if @ascent.save
      render json: @ascent, status: :created
    else
      render json: @ascent.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/ascents/1
  def update
    if @ascent.update(api_v1_ascent_params)
      render json: @ascent
    else
      render json: @ascent.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/ascents/1
  def destroy
    @ascent.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_ascent
      @ascent = Ascent.find(params[:id])
    end

    # Allow user to update or destroy only ascents created by himself
    def authorize_user
      render json: { error: "You are not authorized to edit this ascent." }, status: :unauthorized unless current_user.id == @ascent.user_id
    end

    # Only allow a list of trusted parameters through.
    def api_v1_ascent_params
      params.require(:ascent).permit(:boulder_id, :ascent_date, :attempts).merge(user_id: current_user.id)
    end
end
