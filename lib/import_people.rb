module Admin
  def import_people(filename, course)
    File.open(filename) do |f|
      f.each do |line|
        line.chomp!
        first, last, email = line.split /\t/
        course.people.create! :first_name => first, :last_name => last, :email => email
      end
    end
  end
end

