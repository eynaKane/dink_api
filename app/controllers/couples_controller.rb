class CouplesController < ApplicationController
  before_action :set_couple, only: [:show, :update, :destroy]

  # GET /couples
  def index
    @couples = Couple.all

    render json: @couples
  end

  # GET /couples/1
  def show
    render json: @couple
  end

  # POST /couples
  def create
    @couple = Couple.find_or_create_by!(couple_params)

    @users = users_params.map do |user_params|
      User.find_or_create_by!(user_params)
    end

    render json: { message: "Hi #{@users.map(&:full_name).join(' & ')}!" },
      status: :created, location: @couple
  rescue ActiveRecord::RecordInvalid => error
    render json: { message: error }, status: :unprocessable_entity
  end

  # PATCH/PUT /couples/1
  def update
    if @couple.update(couple_params)
      render json: @couple
    else
      render json: @couple.errors, status: :unprocessable_entity
    end
  end

  # DELETE /couples/1
  def destroy
    @couple.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_couple
      @couple = Couple.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def couple_params
      params.require(:couple).permit(
        :username, :number_of_kids
      )
    end

    def users_params
      params.require(:couple).require(:users).map do |user_params|
        user_params.permit(
          :email,
          :full_name,
          :income_cents
        ).merge(
          couple: @couple
        )
      end
    end
end
