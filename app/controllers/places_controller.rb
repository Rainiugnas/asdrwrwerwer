class PlacesController < ApplicationController
  before_action :places, only: %i(search)

  def search
    db_searcher = PlacesSearcher.new @places, params[:q]

    @places = db_searcher.result
  end

  protected

  def places() @places = Place.all end
end
