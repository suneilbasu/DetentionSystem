namespace :db do
  desc "Erase and fill student and teacher database"
  task :populate => :environment do
    require 'populator'
    require 'faker'

    [Student, Teacher].each(&:delete_all)

    # Create fake students
    Student.populate 100 do |student|
      student.name = Faker::Name.name
      student.email = Faker::Internet.email
    end

    # Create fake teachers
    Teacher.populate 10 do |teacher|
      teacher.name   = Faker::Name.name
      teacher.email  = Faker::Internet.email
    end

    # Create detentions with dates
    Detention.populate 20 do |detention|
      r = Random.new
      detention.teacher_id = r.rand(8)+1
      detention.student_id = r.rand(100)+1
      detention.date = Date.tomorrow+rand(4)
      detention.time = %w(Lunchtime Afterschool).sample
      detention.reason =
          ["Fighting", "No homework", "No uniform", "Chewing gum"].sample
      detention.points = r.rand(2)+1
      detention.parent_detention = 0
      detention.status = "set"
    end

    # Create detentions in holding pen
    Detention.populate 5 do |detention|
      r = Random.new
      detention.teacher_id = 1
      detention.student_id = r.rand(100) + 1
      detention.reason = %w(escalation absent).sample
      detention.points = r.rand(2)+1
      detention.parent_detention = 0
      detention.status = "set"
    end

  end
end