require 'test_helper'

class DetentionTest < ActiveSupport::TestCase
  test "cannot add two detentions at the same time" do
    detention_one = Detention.new
    detention_one.date = Date.today
    detention_one.time = "Afterschool"
    detention_one.student_id = 1

    assert detention_one.save

    detention_two = Detention.new
    detention_two.date = Date.today
    detention_two.time = "Afterschool"
    detention_two.student_id = 1

    assert !detention_two.save

    detention_two.student_id = 2
    assert detention_two.save

    detention_two.student_id = 1
    detention_two.time = "Lunchtime"
    assert detention_two.save

    detention_two.time = "Afterschool"
    detention_two.date = Date.tomorrow
    assert detention_two.save
  end
end
