require "rails_helper"

RSpec.feature "Editing Exercise" do
  before do
    @owner = User.create(email: "owner@example.com", password: "password")


    @owner_exer = @owner.exercises.create!(duration_in_min: 48,
                                workout: "My body building activity",
                                workout_date: "2015-07-03")
    login_as(@owner)
  end

  scenario "with valid data succeeds" do
    visit "/"

    click_link "My Lounge"
    link = "a[href='/users/#{@owner.id}/exercises/#{@owner_exer.id}/edit']"
    find(link).click
    print page.html
    fill_in "Duration", with: 45
    click_button "Update Exercise"

    expect(page).to have_content("Exercise has been updated")
    expect(page).to have_content(45)
    expect(page).not_to have_content(48)
  end
end