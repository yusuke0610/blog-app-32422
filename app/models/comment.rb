class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  with_options presence: true do
   validates :comment 
  end
end
