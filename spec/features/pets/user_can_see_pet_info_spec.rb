require 'rails_helper'

RSpec.describe "pets show page", type: :feature do
  describe "as a user when i visit the pets show page" do
    it "i can see all pets info" do

      shelter_1 = Shelter.create(name:  "Dumb Friends League",
                                 address: "2080 S Quebec St",
                                 city:   "Denver",
                                 state:  "CO",
                                 zip:  "80231")

      pet_1 = shelter_1.pets.create(image: "http://www.petharbor.com/get_image.asp?RES=Detail&ID=A0823795&LOCATION=DDFL",
                                    name:  "Clementine",
                                    description: "Tabby",
                                    approximate_age: "3 y/o",
                                    sex: "Female",
                                    shelter_location: "Dumb Friends League",
                                    adoption_status: "Ready for adoption")
                                    
      pet_2 = shelter_1.pets.create(image: "http://petharbor.com/get_image.asp?RES=Detail&ID=A0824315&LOCATION=DDFL",
                                    name:  "Pumba",
                                    description: "Pitbull",
                                    approximate_age: "1 y/o",
                                    sex: "Male",
                                    shelter_location: "Dumb Friends League",
                                    adoption_status: "Pending")

      visit "/pets/#{pet_1.id}"

      expect(page).to have_css("img[src*= '#{pet_1.image}']")
      expect(page).to have_content(pet_1.name)
      expect(page).to have_content(pet_1.description)
      expect(page).to have_content(pet_1.approximate_age)
      expect(page).to have_content(pet_1.sex)
      expect(page).to have_content(pet_1.adoption_status)

      expect(page).to_not have_css("img[src*= '#{pet_2.image}']")
      expect(page).to_not have_content(pet_2.name)
      expect(page).to_not have_content(pet_2.description)
      expect(page).to_not have_content(pet_2.approximate_age)
      expect(page).to_not have_content(pet_2.sex)
      expect(page).to_not have_content(pet_2.adoption_status)
    end
  end
end
