class Event < ActiveRecord::Base
  attr_accessible :name,:start_date, :start_time,:end_date, :end_time,:description,:address
  belongs_to :user

  validates :name, presence: true, length: { maximum: 60 }
  validates :description, presence: true, length: { maximum: 200 }
  validates :address, presence: true, length: { maximum: 200 }
  validate :past_event, :on => :create
  validate :start_and_end_date

  def past_event
    errors.add(:start_date, "can't be before today") unless start_date >= Date.current
  end

  def start_and_end_date
    if end_date < start_date
      errors.add(:end_date, "is set before the event starts")
    end
    if end_date == start_date && end_time < start_time
      errors.add(:end_time, "is set before the event starts")
    end
  end

  def self.week_events_byday_and_ongoing
    week = (Date.current..(Date.current+7)).to_a
    events = Event.where("end_date >= ? and start_date <= ?", week[0], week[7])
    this_week=week.map{|day| {:day=>day, :events=>events.map{|e| e if e.start_date==day || e.end_date==day}.compact}}
    ongoing=events.map{|e| e if e.start_date < week[0] && e.end_date > week[7]}.compact

    {:this_week => this_week, :ongoing => ongoing}
  end

end
