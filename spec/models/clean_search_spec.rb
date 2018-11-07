require 'rails_helper'

RSpec.describe CleanSearch, type: :model do
  context 'model methods' do
    it "returns geolocations of user search params" do
      location = {
        address: '1600 Pennsylvania Ave',
        city: '',
        state: '',
        zip: '',
        country: ''
      }
      clean_search = CleanSearch.new(location)
      expect(clean_search.address).to eq('1600 Pennsylvania Ave')

      search_results = nil

      VCR.use_cassette('geocoder_pennsylvania_ave') do
        search_results = Geocoder.search('1600 Pennsylvania Ave')
        expect(search_results.first.data.keys).to include('lat')
        expect(search_results.first.data.keys).to include('lon')
        expect(search_results.first.data.keys).to include('display_name')
      end

      expect(search_results).to be_an(Array)
      expect(search_results.count).to eq(2)
      expect(search_results.first.class).to eq(Geocoder::Result::Nominatim)
    end
  end
end
