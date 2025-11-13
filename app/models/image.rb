# == Schema Information
#
# Table name: images
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_images_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Image < ApplicationRecord
  belongs_to :user
  has_one_attached :file_image

  def file_image_url
    return unless file_image.attached?
    Rails.application.routes.url_helpers.rails_blob_url(file_image, only_path: false)
  end
end
