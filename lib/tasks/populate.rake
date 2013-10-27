namespace :db do
  desc "Erase and fill student and teacher database"
  task :populate => :environment do
    require 'populator'
    require 'faker'

    [Student, Teacher].each(&:delete_all)

    Student.populate 100 do |student|
      student.name = Faker::Name.name
      student.email = Faker::Internet.email
    end

    Teacher.populate 10 do |teacher|
      teacher.name   = Faker::Name.name
      teacher.email  = Faker::Internet.email
    end
  end
end