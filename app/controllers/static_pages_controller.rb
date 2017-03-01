class StaticPagesController < ApplicationController
  def home
    @all_places = Place.all
    @places = Place.last(4)
  end
end
