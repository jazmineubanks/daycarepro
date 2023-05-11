class CreateAttendanceRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :attendance_records do |t|
      t.integer :child_id
      t.datetime :check_in_time
      t.datetime :check_out_time

      t.timestamps
    end
  end
end
