FactoryBot.define do
  factory :comment do
    comment         { "text" }

    association :user
    association :tweet
  end
end
