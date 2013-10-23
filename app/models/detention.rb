class Detention < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :student

  validates_presence_of :teacher_id, :student_id, :date, :time, :reason,
  		:points, :parent_detention, :status
  validates_uniqueness_of :time, :scope => [:date, :student_id]
  
  validates :status, inclusion: {in: %w(set done rescheduled escalated)}

  def upcoming_separated_by_datetime
    DetTime = Struct.new(:date, :time)
    all_dets = Detention.where("date > ? AND status = ?", Time.now, 'set')
    unique_det_times = all_dets.uniq.pluck(:date, :time).map{ |det| {
      DetTime.new(det[:date], det[:time]) => all_dets.where(date: det[:date], time: det[:time])
    }}
  end    
end
