require 'rails_helper'

RSpec.describe Location, type: :model do
  context 'model methods' do
    it "returns geolocations object into location object" do
      result = nil

      VCR.use_cassette('geocoder_pennsylvania_ave') do
        result = Geocoder.search('1600 Pennsylvania Ave')
        expect(result.first.data.keys).to include('lat')
        expect(result.first.data.keys).to include('lon')
        expect(result.first.data.keys).to include('display_name')
      end

      location = Location.new(result.first)

      expect(location.display_name).to eq("1600, Pennsylvania Avenue, Avon Park, Savannah, Chatham County, Georgia, 31404, USA")
      expect(location.latitude).to eq("32.051544")
      expect(location.longitude).to eq("-81.063702")
    end
  end
end
