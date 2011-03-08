require 'spec_helper'

describe "People Page :" do

  context "when creating a new person" do
    before do
      visit people_path # index
    end
    it "leaving out first or last name will inform the user that they are required" do
      within('.new_person') do
        click_button 'CREATE'
      end
      page.should have_content("First name can't be blank")
      page.should have_content("Last name can't be blank")
    end

    it "one must have first and last name" do
      within('.new_person') do
        fill_in 'person[first_name]', :with => 'Jona'
        fill_in 'person[last_name]',  :with => 'Ark'
        click_button 'CREATE'
      end
    end
  end
  context "with 3 people" do
    before do
      Person.create(:first_name => 'Grace', :last_name => 'Hopper')
      Person.create(:first_name => 'Anita', :last_name => 'Borg')
      Person.create(:first_name => 'Ada', :last_name => 'Lovelace')
      visit people_path # index
    end

    it "displays Lastname, Firstname" do
      within('.index') do 
        page.save_and_open_page
        page.should have_css('.person_1', :text => 'Borg, Anita')
        page.should have_css('.person_2', :text => 'Hopper, Grace')
        page.should have_css('.person_3', :text => 'Lovelace, Ada')
      end
    end
  end
end

