# == Schema Information
#
# Table name: images
#
#  id          :integer          not null, primary key
#  description :string
#  image       :string
#  image_url   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  child_id    :integer
#
class Image < ApplicationRecord
  belongs_to :child
  has_one_attached :image
  validates :image, presence: true
end

