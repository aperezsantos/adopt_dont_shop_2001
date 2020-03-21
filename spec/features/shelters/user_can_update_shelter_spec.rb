require 'rails_helper'

RSpec.describe "shelter update", type: :feature do
  describe "as a user" do
    describe "when i visit the update shelter form by clicking a link on a shelters page" do
      it "i am taken to a form where i can update an existing shelter" do
        shelter_1 = Shelter.create(name:  "Dumb Friends League",
                                   address: "2080 S Quebec St",
                                   city:   "Denver",
                                   state:  "CO",
                                   zip:  "80231")

        visit "/shelters/#{shelter_1.id}"

        click_link "Update Shelter"

        expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")

        fill_in :name, with: "Updated name"
        fill_in :address, with: "Updated address"
        fill_in :city, with: "Updated city"
        fill_in :state, with: "Updated state"
        fill_in :zip, with: "Updated zip"

        click_on "Submit Update"

        expect(current_path).to eq("/shelters/#{shelter_1.id}")

        expect(page).to have_content("Updated name")
        expect(page).to have_content("Updated address")
        expect(page).to have_content("Updated city")
        expect(page).to have_content("Updated state")
        expect(page).to have_content("Updated zip")
      end
    end
  end
end
