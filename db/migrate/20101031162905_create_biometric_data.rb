class CreateBiometricData < ActiveRecord::Migration
  def self.up
    create_table :biometric_data do |t|
      t.integer :biometrics_id
      t.string :type
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :biometric_data
  end
end
