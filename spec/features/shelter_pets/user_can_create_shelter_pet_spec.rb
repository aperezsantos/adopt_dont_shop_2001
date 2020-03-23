require 'rails_helper'

RSpec.describe "new shelter pet creation", type: :feature do
  describe "as a user when i visit a shelter pets index" do
    describe "i see a link to a form to create/add a new pet" do
      it "i can create a new pet that is adoptable in that shelter" do
        @shelter_1 = Shelter.create(name:  "Dumb Friends League",
                                   address: "2080 S Quebec St",
                                   city:   "Denver",
                                   state:  "CO",
                                   zip:  "80231")

        visit "/shelters/#{@shelter_1.id}/pets/"

        click_link "New Pet"

        expect(current_path).to have_current_path("/shelters/#{@shelter_1.id}/pets/new")

        fill_in :image, with: "http://www.petharbor.com/get_image.asp?RES=Detail&ID=A0823002&LOCATION=DDFL1"
        fill_in :name, with: "Sophia"
        fill_in :description, with: "Lionhead"
        fill_in :approximate_age, with: "5 y/o"
        fill_in :sex, with: "Female"
        fill_in :zip, with: "80212"

        click_on "Create New Pet"

        expect(page).to have_current_path("/shelters/#{@shelter_1.id}/pets")
        expect(page).to have_content("Sophia")
        expect(page).to have_content("Female")
        expect(page).to have_content("Lionhead")
        expect(page).to have_content("5 y/o")
        expect(page).to have_css("img[src*='http://www.petharbor.com/get_image.asp?RES=Detail&ID=A0823002&LOCATION=DDFL1']")
        expect(page).to have_content("Ready for adopt")
      end
    end
  end
end
