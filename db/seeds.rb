# Populate database from the extract

def extract_data() @extract_data ||= JSON.parse File.read 'data/extract.json' end

def places() extract_data['places'] end

def create_places!
  places.each { |place| Place.create name: place['name'] }
end

create_places!
