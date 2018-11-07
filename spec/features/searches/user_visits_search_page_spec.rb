require 'rails_helper'

RSpec.describe 'a user' do
  context 'visiting a search page' do
    before(:each) do
      @user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end
    it 'sees search fields' do
      visit searches_path

      expect(page).to have_field(:address)
      expect(page).to have_field(:city)
      expect(page).to have_field(:state)
      expect(page).to have_field(:zip)
      expect(page).to have_field(:country)
      expect(page).to have_button('Search Location')
    end
    it 'enters a search and is given options to specify location' do
      VCR.use_cassette('geocoder_pennsylvania_ave') do
        location_1 = '1600, Pennsylvania Avenue, Avon Park, Savannah, Chatham County, Georgia, 31404, USA'
        location_2 = '1600, Pennsylvania Avenue, Saint Cloud, Osceola County, Florida, 34769, USA'
        visit searches_path

        fill_in :address, with: '1600 Pennsylvania Ave'
        click_on 'Search Location'

        expect(current_path).to eq(search_path(Search.last.id))
        expect(page).to have_content('Did you mean...?')
        expect(page).to have_link(location_1)
        expect(page).to have_link(location_2)
      end
    end
    it 'asks user to enter new location if query is invalid/returns no results' do
      VCR.use_cassette('lsjdnvlkajsndlviuasbdklhvasbdglihb') do
        service = Geocoder.search('lsjdnvlkajsndlviuasbdklhvasbdglihb')
        visit searches_path

        fill_in :address, with: 'lsjdnvlkajsndlviuasbdklhvasbdglihb'
        click_on 'Search Location'

        expect(current_path).to eq(new_search_path)
        expect(page).to have_content("Sorry, no locations found with those parameters")
      end
    end
  end
end
