json.places do
  json.array! @places do |place|
    json.(place, :id, :name)
  end
end
