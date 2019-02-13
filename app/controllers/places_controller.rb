class PlacesController < ApplicationController
  def search() @places = Place.all end
end
