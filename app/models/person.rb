class Person < ActiveRecord::Base
  validates_presence_of :last_name, :first_name
  has_many :enrollments
  has_many :courses, :through => :enrollments
  has_many :assignments, :through => :courses
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
