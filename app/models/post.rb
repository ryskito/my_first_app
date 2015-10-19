class Post < ActiveRecord::Base

  belongs_to :category

  validates :title, presence: { message: "plz fill in the title!"}

end
