class PlacesSearcher
  def initialize places, params
    @places = places
    @params = params
  end

  def result
    @places.where 'name LIKE :name', name: "%#{@params}%"
  end
end
