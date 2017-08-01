require 'rails_helper'

RSpec.feature "as an authenticated user", js: :true do
  before do
    @user = create(:user)
    @hunt = @user.hunts.create(name: "An urban hunt", description: "This is a hunt description", status: "draft")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  xscenario "i can create a new clue" do
    visit hunt_clues_path(@hunt)

    fill_in("title", with: "A Trivia Clue")
    fill_in("description", with: "This show was cancelled. I mean, COME ON. Yeah, that's a cultural problem is what it is. You know, your average American male is in a perpetual state of adolescence, you know, arrested development. (Hey. That's the name of the show!) There's been a lot of lying in this family. And a lot of love! More lies. Teamocil.")
    fill_in("challenge type", with: "photo challenge")
    fill_in("order", with: 4)
    click_link_or_button "Add Clue"

    expect(page).to have_content("A Trivia Clue")
    expect(page).to have_content("This show was cancelled. I mean, COME ON.")

  end
end
