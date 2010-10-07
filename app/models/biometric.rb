class Biometric < ActiveRecord::Base
  belongs_to :user
  
  validates_numericality_of :user_id, :allow_nil => false
  validates_numericality_of :weight, :allow_nil => true
  validates_numericality_of :systolic, :allow_nil => true
  validates_numericality_of :diastolic, :allow_nil => true

  validates_numericality_of :bpm, :allow_nil => true

  validates_with BiometricValidator
end
