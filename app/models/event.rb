class Event < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :presence => true
  validates :event_date, :presence => true
  validates :description, :presence => true
#  validates :quantity, :numericality => true, :presence => false
end
