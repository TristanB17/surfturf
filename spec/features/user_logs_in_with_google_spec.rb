require 'rails_helper'

RSpec.feature "user logs in" do
  context "using google oauth2" do
    it 'is able to log in with correct credentials' do
      stub_omniauth

      visit root_path

      expect(page).to have_link("Sign in with Google")
      click_link "Sign in with Google"

      expect(page).to have_content("Vinnie Tortellini")
      expect(page).to have_link("Logout")
    end
  end
end
