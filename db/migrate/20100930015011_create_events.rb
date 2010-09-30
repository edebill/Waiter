class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.integer :user_id
      t.datetime :event_date
      t.float :quantity
      t.string :description

      t.timestamps
    end
    add_index :events, :user_id
    add_index :events, :event_date
  end

  def self.down
    drop_table :events
  end
end
