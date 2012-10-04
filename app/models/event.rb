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
end
