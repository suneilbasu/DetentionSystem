class Detention < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :student

  validates_presence_of :teacher_id, :student_id, :date, :time, :reason,
  		:points, :parent_detention, :status
  validates_uniqueness_of :time, :scope => [:date, :student_id]
  
  validates :status, inclusion: {in: %w(set done rescheduled escalated)}
end
