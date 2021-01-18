class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :tweet_tag_relations
  has_many :tags, through: :tweet_tag_relations
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :text
    validates :user_id
    
  end

  # def self.search(search)
  #   if search != ""
  #     Tweet.where('text LIKE(?)', "%#{search}%")
  #   else
  #     Tweet.all
  #   end
  # end
end
