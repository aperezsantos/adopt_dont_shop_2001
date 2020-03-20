require 'rails_helper'

RSpec.describe "new shelter" do
  describe "as a visitor" do
    describe "when i visit the new shelter form by clicking a link on the index" do
      it "i can create a new shelter" do

        visit "/shelters"

        click_link "New Shelter"

        expect(current_path).to ep ("artists/new")

        fill_in "Name", with: "Denver Cat Company"

        click_on "Create Shelter"

        expect(current_path).to eq("/shelters")
        expect(page).to have_content("Denver Cat Company")
      end
    end
  end
end