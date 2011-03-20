require 'lib/import_people.rb'

namespace :admin  do
  include Admin
  desc "import student data, use COURSE=4, FILENAME=somedir/whatever.txt"
  task :import => :environment do
    filename = ENV['FILENAME']
    course_id = ENV['COURSE'].to_i
    course = Course.find(course_id)
    puts "could not find course with id #{course_id}" if course.nil?
    import_people(filename, course)
  end
end