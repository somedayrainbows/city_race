require 'rails_helper'

RSpec.feature "as an authenticated user" do
  scenario "I cannot access pages beyond login, signup, or home" do

    visit '/hunts/new'

    expect(current_path).to eq(new_hunt_path)

    expect(page).to have_content("Oops, The page you were looking for doesn't exist.")
    expect(page).to have_content("You may have mistyped the address or the page may have moved.")
  end
end
