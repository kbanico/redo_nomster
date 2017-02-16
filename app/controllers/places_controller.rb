class PlacesController < ApplicationController
  def index
    @places = Place.order('created_at DESC').page(params[:page])
  end

  def new
    @place = Place.new
  end

  def create
    Place.create(place_params)
    redirect_to root_path
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end

end
