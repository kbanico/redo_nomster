class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_place, only: [:show, :edit, :update, :destroy]


  def index
    @places = Place.order('created_at DESC').page(params[:page])
  end

  def new
    @place = Place.new
  end

  def create
    current_user.places.create(place_params)
    redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
    @place.update_attributes(place_params)
    if @place.save
      flash[:success] = "Place Updated"
      redirect_to place_path(@place)
    end
  end

  def destroy
    @place.destroy
    flash[:success] = "Place was removed"
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
