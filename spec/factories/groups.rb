# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
  	name {Faker::Commerce.department}
  	description {Faker::Lorem.paragraph}
  	founder_id 1
  end
end
