class Post < ActiveRecord::Base

  belongs_to :category
  belongs_to :user

  validates :title, presence: { message: "plz fill in the title!"}
  validates :user_id, presence: true

  mount_uploader :picture, PictureUploader

  scope :search_user, -> (user_id) {
      where(user_id: user_id) if user_id.present?
  }

  scope :search_category, -> (category_id) {
    where(category_id: category_id) if category_id.present?
  }

  scope :search_keyword, -> (keyword) {
    where("title ILIKE ? or content ILIKE ?", "%#{keyword}%", "%#{keyword}%") if keyword.present?
  }

  paginates_per 10

  def created_by?(user)
    return false unless user
    user_id == user.id
  end

end