module Admin
  def import_people(filename)
    File.open(filename) do |f|
      f.each do |line|
        line.chomp!
        first, last = line.split /\t/
        Person.create! :first_name => first, :last_name => last
      end
    end
  end
end

