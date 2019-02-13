class GooglePlacesSearcher
  def initialize params
    @params = params

    @client = GooglePlaces::Client.new Rails.application.secrets.place_api_key
  end

  def result
    return [] if invalid_params?

    places = fetch_places
    places = [places] unless places.is_a? Array

    places.map { |place| { name: place.description, id: place.place_id } }
  end

  private

  def valid_params?() @params.is_a?(String) && @params.present? end
  def invalid_params?() valid_params? == false end

  def fetch_places
    places = @client.predictions_by_input(
      @params,
      lat: 0.0,
      lng: 0.0,
      radius: 20000000,
      types: ['establishment'],
      language: 'fr',
      components: 'country:fr'
    )
  rescue GooglePlaces::InvalidRequestError
    []
  end
end
