class AddTotalableHrmAttendanceTypes < ActiveRecord::Migration
  def self.up
    add_column :hrm_attendance_types, :totalable, :boolean, :default => false, :null => false
  end

  def self.down
    remove_column :hrm_attendance_types, :totalable
  end
end
