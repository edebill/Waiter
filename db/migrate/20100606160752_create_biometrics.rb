class CreateBiometrics < ActiveRecord::Migration
  def self.up
    create_table :biometrics do |t|
      t.datetime :record_date
      t.float :weight
      t.integer :systolic
      t.integer :diastolic
      t.integer :bpm
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :biometrics
  end
end
