class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_place, only: [:show, :edit, :update, :destroy]


  def index
    @places = Place.order('created_at DESC').page(params[:page])
  end

  def new
    @place = Place.new
  end

  def create

    @place = current_user.places.create(place_params)
    if @place.valid?
      redirect_to root_path
    else
      render "new", status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    if current_user != @place.user
      flash[:danger] = "You are not allowed to perform that action"
      redirect_to root_path
    end
  end

  def update
    @place.update_attributes(place_params)
    if @place.save
      flash[:success] = "Place Updated"
      redirect_to place_path(@place)
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    if current_user != @place.user
      return render text: 'Not Allowed', status: :forbidden

    end
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
