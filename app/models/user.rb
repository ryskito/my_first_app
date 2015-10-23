class User < ActiveRecord::Base


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # devise :database_authenticatable, :registerable,
  #        :confirmable, :recoverable, stretches: 20

  has_many :posts
  has_many :categories, through: :posts


end
