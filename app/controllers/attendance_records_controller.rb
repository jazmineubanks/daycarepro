class AttendanceRecordsController < ApplicationController
  def index
    matching_attendance_records = AttendanceRecord.all

    @list_of_attendance_records = matching_attendance_records.order({ :created_at => :desc })

    render({ :template => "attendance_records/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_attendance_records = AttendanceRecord.where({ :id => the_id })

    @the_attendance_record = matching_attendance_records.at(0)

    render({ :template => "attendance_records/show.html.erb" })
  end

  def create
    the_attendance_record = AttendanceRecord.new
    the_attendance_record.child_id = params.fetch("query_child_id")
    the_attendance_record.check_in_time = params.fetch("query_check_in_time")
    the_attendance_record.check_out_time = params.fetch("query_check_out_time")

    if the_attendance_record.valid?
      the_attendance_record.save
      redirect_to("/attendance_records", { :notice => "Attendance record created successfully." })
    else
      redirect_to("/attendance_records", { :alert => the_attendance_record.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_attendance_record = AttendanceRecord.where({ :id => the_id }).at(0)

    the_attendance_record.child_id = params.fetch("query_child_id")
    the_attendance_record.check_in_time = params.fetch("query_check_in_time")
    the_attendance_record.check_out_time = params.fetch("query_check_out_time")

    if the_attendance_record.valid?
      the_attendance_record.save
      redirect_to("/attendance_records/#{the_attendance_record.id}", { :notice => "Attendance record updated successfully."} )
    else
      redirect_to("/attendance_records/#{the_attendance_record.id}", { :alert => the_attendance_record.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_attendance_record = AttendanceRecord.where({ :id => the_id }).at(0)

    the_attendance_record.destroy

    redirect_to("/attendance_records", { :notice => "Attendance record deleted successfully."} )
  end
end
