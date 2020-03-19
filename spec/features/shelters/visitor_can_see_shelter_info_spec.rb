require 'rails_helper'

RSpec.describe "shelter id page", type: :feature do
  it "can see all info of individual shelter" do
    shelter_1 = Shelter.create(id:  1,
                               name:  "Dumb Friends League",
                               address: "2080 S Quebec St",
                               city:   "Denver",
                               state:  "CO",
                               zip:  "80231")

    visit '/shelters/id'

    expect(page).to have_content(shelter_1.id)
    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)
  end
end
