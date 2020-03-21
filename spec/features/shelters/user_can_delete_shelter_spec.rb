require 'rails_helper'

RSpec.describe "delete shelter", type: :feature do
  describe "as a user" do
    describe "when i visit a shelter show page" do
      it "i can delete a shelter" do

        shelter_1 = Shelter.create(name:  "Dumb Friends League",
                                   address: "2080 S Quebec St",
                                   city:   "Denver",
                                   state:  "CO",
                                   zip:  "80231")

        visit "/shelters/#{shelter_1.id}"

        click_button 'Delete'

        expect(current_path).to eq('/shelters')

        expect(page).to_not have_content(shelter_1.name)
        expect(page).to_not have_content(shelter_1.address)
        expect(page).to_not have_content(shelter_1.city)
        expect(page).to_not have_content(shelter_1.state)
        expect(page).to_not have_content(shelter_1.zip)

        expect(page).to_not have_button('Delete')
      end
    end
  end
end
