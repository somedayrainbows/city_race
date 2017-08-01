require 'rails_helper'

RSpec.feature "as an authenticated user" do
  before do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  scenario "i can log out" do
    visit root_path
    expect(current_path).to eq(root_path)
    within(".navbar-collapse") do
      expect(page).to have_content("Log Out")
    end

    within(".navbar-collapse") do
      click_on "Log Out"
    end

    expect(current_path).to eq(login_path)

    expect(page).to have_content("You have logged out successfully.")
  end
end
