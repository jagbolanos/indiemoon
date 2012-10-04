class Event < ActiveRecord::Base
  attr_accessible :name,:start_date,:end_date,:description,:address
  belongs_to :user

  validates :name, presence: true, length: { maximum: 60 }
  validates :description, presence: true, length: { maximum: 200 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :address, presence: true, length: { maximum: 200 }
end
