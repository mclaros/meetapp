# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	username {Faker::Internet.user_name}
  	full_name {Faker::Name.name}
  	bio {Faker::Lorem.paragraph}
  	email {Faker::Internet.email}
  	location {Faker::Address.city + ", " + Faker::Address.state}
  end
end
