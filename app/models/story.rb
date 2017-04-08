class Story < ApplicationRecord
  validates :link, presence: true
  validates :email, presence: true
  validates :link, format: { with: /\A(http|https)/ }
end
