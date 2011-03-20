require 'spec_helper'
require 'lib/import_people'

describe "import people" do
  include Admin
  before do
    @filename = "spec/fixtures/people_data.txt"
    @data = []
    File.open(@filename, "w+") do |f|
      3.times do
        name = {:first => Faker::Name.first_name, :last => Faker::Name.last_name}
        @data << name
        f.puts "#{name[:first]}\t#{name[:last]}"
      end
    end
    @person_count = Person.count
    import_people(@filename)

  end
  
  it "creates the number of records as are in the file" do
    Person.count.should == @person_count + 3
  end
  
  it "creates records for the people that are in the file" do
    3.times do |n|
      name = @data[n]
      p = Person.where(:first_name => name[:first], :last_name => name[:last]).first
      p.should_not be_nil
    end
  end
  
end
