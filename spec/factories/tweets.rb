FactoryBot.define do
  factory :tweet do
    title             { "title" }
    text              { "text" }
    
    association :user

    after(:build) do |image|
      image.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
