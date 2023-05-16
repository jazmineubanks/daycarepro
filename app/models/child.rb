# == Schema Information
#
# Table name: children
#
#  id            :integer          not null, primary key
#  date_of_birth :string
#  first_name    :string
#  last_name     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  parent_id     :integer
#
# /workspaces/daycarepro/app/models/child.rb
class Child < ApplicationRecord
  has_many :images, class_name: "Image", foreign_key: "child_id", dependent: :destroy
  has_many :notes, class_name: "Note", foreign_key: "child_id", dependent: :destroy
  has_many :attendance_records, class_name: "AttendanceRecord", foreign_key: "child_id", dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
end
