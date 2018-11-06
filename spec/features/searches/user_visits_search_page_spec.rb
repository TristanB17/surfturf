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
      expect(page).to have_field(:zip_code)
      expect(page).to have_field(:country)
      expect(page).to have_button('Search Location')
    end
    it 'enters a search and is given options to specify location' do
      visit searches_path

      # fill_in :address, with: '1600 Pennsylvania Ave'
      fill_in :address, with: '1600 Pennsylvania Ave'
      click_on 'Search Location'

      expect(current_path).to eq(searches_path)
      expect(page).to have_content('Did you mean...?')
      expect(page).to have_link('Savannah, Georgia, USA')
      expect(page).to have_link('Saint Cloud, Florida, USA')
    end
  end
end
