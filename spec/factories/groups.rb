# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
  	name {Faker::Commerce.department}
  	description {Faker::Lorem.paragraph}
  	founder_id { User.pluck(:id).sample }
  end
end
