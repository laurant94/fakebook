class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image; ImageUploader

  validates :user_id, presence: true

  scope :online, ->(online) { where(online: online)}
  scope :for_user, ->(user_id) { where(user_id: user_id)}
  scope :insert_author, -> { includes(:user)}
  
  #methods de class
  def is_author?(author)
    user_id == author
  end

end
