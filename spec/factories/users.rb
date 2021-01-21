FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.free_email }
    password              { "yusuke1" }
    password_confirmation { password }
    name                  { Faker::Name.name }
  end
end
