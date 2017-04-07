class Story < ApplicationRecord
  validates :link, presence: true
  validates :email, presence: true
end
