class Comment < ApplicationRecord
  belongs_to :story
  belongs_to :created_by_id, class_name: "User"
end
