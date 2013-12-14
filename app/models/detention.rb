class Detention < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :student

  DetTime = Struct.new(:date, :time)

  validates_presence_of :teacher_id, :student_id, :reason,
  		:points, :parent_detention, :status
  validates_uniqueness_of :time, :scope => [:date, :student_id]

  validates :status, inclusion: {in: %w(set done rescheduled escalated)}

  validate :date_is_in_future?

  def self.upcoming_separated_by_datetime
    all_dets = Detention.where("date > ? AND status = ?", Time.now, 'set')
        .order(date: :asc, time: :desc)
    unique_det_times = all_dets.uniq.pluck(:date, :time)
    array = Array.new
    unique_det_times.each do |datetime|
      dt = DetTime.new(datetime[0], datetime[1])
      array << [dt].push(all_dets.where(date: dt[:date], time: dt[:time]).to_a)
    end
    array
  end

  def self.pen
    dets = Detention.where(date: nil)
  end

  private
    def date_is_in_future?
      if self.date < Date.today
        errors.add(:date, 'must be in the future')
      end
    end
end
