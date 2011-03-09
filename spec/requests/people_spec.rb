require 'spec_helper'
   
describe "People Page :" do

  context "when creating a new person" do
    before do
      visit new_person_path # index
    end
    it "leaving out first or last name will inform the user that they are required" do
      within('.new_person') do
        click_button 'CREATE'
      end
      page.save_and_open_page
      page.should have_content("First name can't be blank")
      page.should have_content("Last name can't be blank")
    end

    it "one must have first and last name" do
      within('.new_person') do
        fill_in 'First Name', :with => 'Jona'
        fill_in 'Last name',  :with => 'Ark'
        click_button 'CREATE'
      end
      page.should have_content('Jona Ark')
    end
  end
  context "with 3 people" do
    before do
      Person.create(:first_name => 'Grace', :last_name => 'Hopper')
      Person.create(:first_name => 'Anita', :last_name => 'Borg')
      Person.create(:first_name => 'Ada', :last_name => 'Lovelace')

      visit people_path # index
    end

    it "displays Firstname Lastname" do
      page.save_and_open_page
      page.should have_content('Anita Borg')
      page.should have_content('Grace Hopper')
      page.should have_content('Ada Lovelace')
    end
  end
end

