require 'rails_helper'

RSpec.feature "user logs in" do
  context "using google oauth2" do
    it 'is able to log in with correct credentials' do
      stub_omniauth

      visit root_path

      expect(page).to have_link("Sign in with Google")
      click_link "Sign in with Google"

      expect(page).to have_content("Vinnie")
      expect(page).to have_link("Logout")
    end
    it 'is able to logout from being logged in' do
      stub_omniauth

      visit root_path

      expect(page).to have_link("Sign in with Google")
      click_link "Sign in with Google"
      click_link "Logout"

      expect(page).to have_content("Sign in with Google")
    end
  end
end
