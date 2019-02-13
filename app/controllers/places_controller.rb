class PlacesController < ApplicationController
  before_action :places, only: %i(search)

  def search
    db_searcher = PlacesSearcher.new @places, params[:q]
    google_searcher = GooglePlacesSearcher.new params[:q]

    @places = db_searcher.result
    @google_places = google_searcher.result
  end

  protected

  def places() @places = Place.all end
end
