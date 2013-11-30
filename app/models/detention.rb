class Detention < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :student

  DetTime = Struct.new(:date, :time)

  validates_presence_of :teacher_id, :student_id, :reason,
  		:points, :parent_detention, :status
  validates_uniqueness_of :time, :scope => [:date, :student_id]

  validates :status, inclusion: {in: %w(set done rescheduled escalated)}

  def self.upcoming_separated_by_datetime
    all_dets = Detention.where("date > ? AND status = ?", Time.now, 'set')
    unique_det_times = all_dets.uniq.pluck(:date, :time).map{ |det| {
      DetTime.new(det[:date], det[:time]) => all_dets.where(date: det[:date], time: det[:time])
    }}
  end
end
