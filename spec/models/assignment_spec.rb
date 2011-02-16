require 'spec_helper'

describe Assignment do
  it "should be valid with description, assigned_on and due_on dates" do
    a = Assignment.new(:description => "a conversation with your mother",
                       :assigned_on => Date.civil(2010,1,2),
                       :due_on => Date.civil(2010,1,15))
    a.save!
    a.should be_valid
  end


end
