class Story < ApplicationRecord
  validates :link, presence: true
  validates :link, format: { with: /\A(http|https)/ }

  belongs_to :created_by, class_name: "User"
  has_many :comments

  include ImageUploader[:image]
end
