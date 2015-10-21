class Post < ActiveRecord::Base

  belongs_to :category

  validates :title, presence: { message: "plz fill in the title!"}

  paginates_per 10

end
