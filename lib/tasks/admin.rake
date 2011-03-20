require 'lib/import_people.rb'

namespace :admin  do
  include Admin
  desc "import student data, use FILENAME=somedir/whatever.txt"
  task :import => :environment do
    filename = ENV['FILENAME']
    import_people(filename)
  end
end