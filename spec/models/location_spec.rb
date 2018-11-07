require 'rails_helper'

RSpec.describe Location, type: :model do
  context 'model methods' do
    xit "returns geolocations object into location object" do
      locations = Geocoder.search('1600 Pennsylvania Ave')

      location = Location.new(locations.first)

      expect(location.display_name).to eq("1600, Pennsylvania Avenue, Avon Park, Savannah, Chatham County, Georgia, 31404, USA")
      expect(location.latitude).to eq("32.051544")
      expect(location.longitude).to eq("-81.063702")
    end
  end
end
