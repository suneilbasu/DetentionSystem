require 'test_helper'

class DetentionTest < ActiveSupport::TestCase
  test "cannot add two detentions at the same time" do
    detention_one = build_test_detention
    detention_one.date = Date.today
    detention_one.time = "Afterschool"
    detention_one.student_id = 1

    assert detention_one.save, detention_one.errors.full_messages

    detention_two = build_test_detention
    detention_two.date = Date.today
    detention_two.time = "Afterschool"
    detention_two.student_id = 1

    assert !detention_two.save, detention_two.errors.full_messages

    detention_two.student_id = 2
    assert detention_two.save, detention_two.errors.full_messages

    detention_two.student_id = 1
    detention_two.time = "Lunchtime"
    assert detention_two.save, detention_two.errors.full_messages

    detention_two.time = "Afterschool"
    detention_two.date = Date.tomorrow
    assert detention_two.save, detention_two.errors.full_messages
  end

  def build_test_detention
    d = Detention.new
    d.points = 2
    d.reason = "Fighting"
    d.teacher_id = 1
    d.parent_detention = 0
    d.status = "set"
    d
  end
end
