class Detention < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :student

  validates_uniqueness_of :time, :scope => [:date, :student_id]
end
