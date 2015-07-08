class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  validates :description, :presence => true
end
