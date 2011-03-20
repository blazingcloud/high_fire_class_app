class Course < ActiveRecord::Base
  has_many :assignments
  
  has_many :enrollments
  has_many :people, :through => :enrollments
end
