class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  with_options presence: true do
   validates :comment 
   validates :user_id
   validates :tweet_id
  end
end
