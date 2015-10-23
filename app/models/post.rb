class Post < ActiveRecord::Base

  belongs_to :category
  belongs_to :user

  validates :title, presence: { message: "plz fill in the title!"}
  validates :user_id, presence: true

  mount_uploader :picture, PictureUploader


  paginates_per 10

end
