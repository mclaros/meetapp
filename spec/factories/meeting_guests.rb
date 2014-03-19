# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :meeting_guest do
  	meeting_id { Meeting.pluck(:id) }
  	user_id { User.pluck(:id) }
  	status { ["ATTENDING", "NOT ATTENDING"].sample }
  end
end
