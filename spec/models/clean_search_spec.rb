require 'rails_helper'

RSpec.describe CleanSearch, type: :model do
  context 'model methods' do
    xit "returns geolocations of user search params" do
      location = {
        address: '1600 Pennsylvania Ave',
        city: '',
        state: '',
        zip: '',
        country: ''
      }
      clean_search = CleanSearch.new(location)
      expect(clean_search.address).to eq('1600 Pennsylvania Ave')

      search_results = clean_search.location_results


      expect(search_results).to be_an(Array)
      expect(search_results.count).to eq(2)
      expect(search_results.first.class).to eq(Location)
    end
  end
end
