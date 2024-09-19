require 'rails_helper'

RSpec.describe "User registration", type: :system do
  before do
    driven_by(:rack_test)
  end

  context "when registering" do
    let(:email_address) { FFaker::Internet.email }

    it "allows a user to register successfully", js: true do
      visit register_path

      fill_in "Email", with: email_address
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"

      click_button "Sign Up"

      expect(page).to have_content("Account created successfully, watch for the validation email!")
      expect(User.last.email).to eq email_address
    end

    it "shows error messages for invalid registration", js: true do
      visit register_path

      fill_in "Email", with: ""
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "different"

      click_button "Sign Up"

      expect(page).to have_content("doesn't match Password")
    end
  end
end
