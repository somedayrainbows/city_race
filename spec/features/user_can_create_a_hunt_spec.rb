require 'rails_helper'

RSpec.feature "as an authenticated user" do
  before do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  scenario "i can create a new hunt" do
    visit root_path
    click_on "Create Hunt"

    expect(current_path).to eq(new_hunt_path)

    fill_in "Name", with: "A Fun Scavenger Hunt"
    fill_in "Description", with: "This show was cancelled. I mean, COME ON. Yeah, that's a cultural problem is what it is. You know, your average American male is in a perpetual state of adolescence, you know, arrested development. (Hey. That's the name of the show!) There's been a lot of lying in this family. And a lot of love! More lies. Teamocil. I hate the Wetlands. They're stupid and wet, and there are bugs everywhere, and I think I maced a crane. A group of British builders operating outside the O.C. Hey, it was one night of wild passion! And yet you didn't notice her body? I like to look in the mirror. I made a huge tiny mistake."
    click_on "Create Hunt"

    expect(current_path).to eq(hunts_path)
    expect(page).to have_content("A Fun Scavenger Hunt")
    expect(page).to have_content("Edit Hunt")
    expect(page).to have_content("New Hunt")
  end
end
