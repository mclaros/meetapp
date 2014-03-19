# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group_membership do
  	group_id { Group.pluck(:id).sample }
  	user_id { User.pluck(:id).sample }
  end
end
