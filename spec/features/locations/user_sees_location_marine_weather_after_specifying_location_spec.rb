require 'rails_helper'

RSpec.describe 'a user' do
  context 'visiting a search page' do
    before(:each) do
      @user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end
    it 'sees marine weather for selected location' do
      desired_location = 'Huntington Beach'

      visit searches_path

      fill_in :address, with: desired_location
      click_on 'Search Location'

      click_link(desired_location, match: :first)

      expect(current_path).to eq(locations_path)
      expect(page).to have_content("Local Marine Weather Conditions for: #{desired_location}")
    end
  end
end
