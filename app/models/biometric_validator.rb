class BiometricValidator < ActiveModel::Validator

  def validate(record)
    # need a weight, both systolic and diastolic, or a bpm
    unless ! record.weight.blank? || 
        (! record.systolic.blank? && ! record.diastolic.blank?) ||
        ! record.bpm.blank?
      record.errors[:base] << "You must supply at least one of: weight, blood pressure measurement (both systolic and diastolic) or pulse rate."
    end

    unless record.systolic.blank? && record.diastolic.blank?
      if record.systolic.blank? || record.diastolic.blank?
        record.errors[:base] << "You're missing part of your blood pressure"
      end
    end

  end


end
