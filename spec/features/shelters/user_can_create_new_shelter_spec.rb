require 'rails_helper'

RSpec.describe "new shelter creation" do
  describe "as a user" do
    describe "when i visit the new shelter form by clicking a link on the index" do
      it "i can create a new shelter" do

        visit "/shelters"

        click_link "New Shelter"

        expect(current_path).to eq("/shelters/new")

        fill_in :name, with: "Denver Cat Company"
        fill_in :address, with: "3929 Tennyson St."
        fill_in :city, with: "Denver"
        fill_in :state, with: "CO"
        fill_in :zip, with: "80212"

        click_on "Create Shelter"

        expect(current_path).to eq("/shelters")
        expect(page).to have_content("Denver Cat Company")
      end
    end
  end
end
