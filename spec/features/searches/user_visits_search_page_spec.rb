require 'rails_helper'

RSpec.describe 'a user' do
  context 'visiting a search page' do
    it 'sees search fields' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit searches_path

      expect(page).to have_field(:address)
      expect(page).to have_field(:city)
      expect(page).to have_field(:state)
      expect(page).to have_field(:country)
      expect(page).to have_field(:zip_code)
    end
  end
end
