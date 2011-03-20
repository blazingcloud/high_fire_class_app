class Course < ActiveRecord::Base
  has_many :assignments
end
