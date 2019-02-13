json.places do
  json.array! @places do |place|
    json.(place, :id, :name)
  end
end

json.google_places do
  json.array! @google_places do |place|
    json.(place, :id, :name)
  end
end
