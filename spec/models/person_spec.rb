require 'spec_helper'

describe Person do
  describe "with valid attributes" do
    before do
        @valid_attributes = {:first_name => "Lisa", :last_name => "Meitner"}
        @person = Person.new(@valid_attributes)
    end
    it 'should save' do
      @person.save!
    end
    it 'should have many enrollments' do
      @person.enrollments.should be_empty
    end
    it "should have many courses" 
  end

  it 'should not save a record with only first name' do
    p = Person.new(:first_name => "Marie")
    p.should_not be_valid
    p.errors[:last_name].should include("can't be blank")
  end

  it 'should not save a record with only last name' do
    p = Person.new(:last_name => "Curie")
    p.should_not be_valid
    p.errors[:first_name].should include("can't be blank")
  end
  
end
