# == Schema Information
#
# Table name: mass_emails
#
#  id         :integer          not null, primary key
#  context    :text
#  sent_at    :datetime
#  subject    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  admin_id   :integer
#
class MassEmail < ApplicationRecord
  belongs_to(:admin, { :required => true, :class_name => "User", :foreign_key => "admin_id" })
end
