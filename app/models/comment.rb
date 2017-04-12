class Comment < ApplicationRecord
  belongs_to :story
  belongs_to :created_by, class_name: "User"
end
