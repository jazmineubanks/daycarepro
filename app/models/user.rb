# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  first_name :string
#  last_name  :string
#  password   :string
#  role       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_many(:notes, { :class_name => "Note", :foreign_key => "admin_id", :dependent => :destroy })
  has_many(:mass_emails, { :class_name => "MassEmail", :foreign_key => "admin_id", :dependent => :destroy })
end
