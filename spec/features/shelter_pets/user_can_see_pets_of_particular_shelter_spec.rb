require 'rails_helper'

RSpec.describe "shelter show page", type: :feature do
  describe "as a user, when i visit shelter show page" do
    it "i can see pets that are adoptable in that shelter" do
      @shelter_1 = Shelter.create(name:  "Dumb Friends League",
                                 address: "2080 S Quebec St",
                                 city:   "Denver",
                                 state:  "CO",
                                 zip:  "80231")

      @pet_1 = @shelter_1.pets.create(image: "http://www.petharbor.com/get_image.asp?RES=Detail&ID=A0823795&LOCATION=DDFL",
                                    name:  "Clementine",
                                    approximate_age: "3 y/o",
                                    sex: "Male",
                                    adoption_status: "Ready for adoption")

      @pet_2 = @shelter_1.pets.create(image: "http://petharbor.com/get_image.asp?RES=Detail&ID=A0824315&LOCATION=DDFL",
                                    name:  "Pumba",
                                    approximate_age: "1 y/o",
                                    sex: "Male",
                                    adoption_status: "Pending")

      visit "/shelters/#{@shelter.id}/pets"

      expect(page).to have_css("img[src*='#{@pet_1.image}']")
      expect(page).to have_content(@pet_1.name)
      expect(page).to have_content(@pet_1.approximate_age)
      expect(page).to have_content(@pet_1.sex)
a      expect(page).to have_content(@pet_1.adoption_status)

      expect(page).to have_css("img[src*='#{@pet_2.image}']")
      expect(page).to have_content(@pet_2.name)
      expect(page).to have_content(@pet_2.approximate_age)
      expect(page).to have_content(@pet_2.sex)
      expect(page).to have_content(@pet_2.adoption_status)
    end
  end
end
