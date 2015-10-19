class Post < ActiveRecord::Base

  validates :title, presence: { message: "plz fill in the content!"}

end
