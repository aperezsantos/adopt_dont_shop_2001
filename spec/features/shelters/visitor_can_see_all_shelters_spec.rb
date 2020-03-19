require 'rails_helper'

RSpec.describe "shelter index page", type: :feature do
  it "can see all shelters in the system" do
    shelter_1 = Shelter.create(name: "Dumb Friends League")
    shelter_2 = Shelter.create(name: "Cat Care Society")
    shelter_3 = Shelter.create(name: "Foothills Animal Shelter")

    visit '/shelters'

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
    expect(page).to have_content(shelter_3.name)
  end
end
