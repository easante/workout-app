require "rails_helper"

RSpec.feature "Deleting Exercise" do
  before do
    @owner = User.create(first_name: "Owner",
                        last_name: "Doe",
                        email: "owner@example.com",
                        password: "password")


    @owner_exer = @owner.exercises.create!(duration_in_min: 48,
                                workout: "My body building activity",
                                workout_date: "2015-07-03")
    login_as(@owner)
  end

  scenario do
    visit "/"

    click_link "My Lounge"
    link = "//a[contains(@href,
            '/users/#{@owner.id}/exercises/#{@owner_exer.id}')
            and .//text()='Destroy']"
    find(:xpath, link).click

    expect(page).to have_content("Exercise has been deleted")
  end
end
