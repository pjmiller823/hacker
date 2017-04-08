class Story < ApplicationRecord
  validates :link, presence: true
  validates :email, presence: true
  # validates_format_of :link, with: :URI.regexp(%w{http https})
  validates :link, format: { with: /\A(http:|https)/ }
end
