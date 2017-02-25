class StaticPagesController < ApplicationController
  def home
    @places = Place.last(4)
  end
end
