FactoryGirl.define do
  factory :registered_app do
    sequence(:url) { |n| "http://www.example#{n}.com" }
    sequence(:name) { |n| "App Name #{n}" } 
    association :user
  end
end
