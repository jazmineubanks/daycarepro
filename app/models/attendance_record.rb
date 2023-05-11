# == Schema Information
#
# Table name: attendance_records
#
#  id             :integer          not null, primary key
#  check_in_time  :datetime
#  check_out_time :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  child_id       :integer
#
class AttendanceRecord < ApplicationRecord
  belongs_to(:child, { :required => true, :class_name => "Child", :foreign_key => "child_id" })
end
