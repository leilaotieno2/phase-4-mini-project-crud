class SpicesController < ApplicationController
  before_action :set_spice, only: [:update, :destroy]

  def index
    spices = Spice.all
    render json: spices
  end

  def create
    spice = Spice.new(spice_params)
    if spice.save
      render json: spice, status: :created
    else
      render json: { errors: spice.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @spice.update(spice_params)
      render json: @spice
    else
      render json: { errors: @spice.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @spice.destroy
    head :no_content
  end

  private

  def set_spice
    @spice = Spice.find(params[:id])
  end

  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end
  
end
