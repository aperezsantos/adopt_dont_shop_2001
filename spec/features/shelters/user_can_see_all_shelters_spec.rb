require 'rails_helper'


RSpec.describe "shelter index page", type: :feature do
  describe "as a user" do
    describe "i visit a shelter index page" do
      it "i can see all shelter names in the system" do

      shelter_1 = Shelter.create(name:  "Dumb Friends League",
                                  address: "2080 S Quebec St",
                                  city:   "Denver",
                                  state:  "CO",
                                  zip:  "80231")

      shelter_2 = Shelter.create(name: "Cat Care Society",
                                 address:  "5787 W 6th Ave",
                                 city: "Lakewood",
                                 state:  "CO",
                                 zip:  "80214")

      visit '/shelters'

      expect(page).to have_content(shelter_1.name)
      expect(page).to have_content(shelter_2.name)
      end
    end
  end
end
