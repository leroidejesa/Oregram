class Image < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  validates :description, :presence => true



  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>", large: "800x800>", xlarge: "1200x1200>" }
  #set image sizes before uploading images so it can reference url  i.e url(:large)

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
