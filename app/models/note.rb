# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  context    :text
#  submitted  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  admin_id   :integer
#  child_id   :integer
#
class Note < ApplicationRecord
  belongs_to(:admin, { :required => true, :class_name => "User", :foreign_key => "admin_id" })
  belongs_to(:child, { :required => true, :class_name => "Child", :foreign_key => "child_id" })
end
