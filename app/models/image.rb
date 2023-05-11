# == Schema Information
#
# Table name: images
#
#  id          :integer          not null, primary key
#  description :string
#  image_url   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  child_id    :integer
#
class Image < ApplicationRecord
  belongs_to(:child, { :required => true, :class_name => "Child", :foreign_key => "child_id" })
end
