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
    @couple = Couple.new(couple_params)

    if @couple.save
      render json: @couple, status: :created, location: @couple
    else
      render json: @couple.errors, status: :unprocessable_entity
    end
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
      params.require(:couple).permit(:username, :number_of_kids)
    end
end
