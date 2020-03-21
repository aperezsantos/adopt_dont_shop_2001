require 'rails_helper'

RSpec.describe "shelter show page", type: :feature do
  describe "as a user" do
    describe "i visit a shelter show page" do
      it "i can see all info of that specific shelter" do

      shelter_1 = Shelter.create(name:  "Dumb Friends League",
                                 address: "2080 S Quebec St",
                                 city:   "Denver",
                                 state:  "CO",
                                 zip:  "80231")

      visit "/shelters/#{shelter_1.id}"

      expect(page).to have_content(shelter_1.name)
      expect(page).to have_content(shelter_1.address)
      expect(page).to have_content(shelter_1.city)
      expect(page).to have_content(shelter_1.state)
      expect(page).to have_content(shelter_1.zip)
      end
    end
  end
end
