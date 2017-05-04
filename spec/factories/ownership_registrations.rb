FactoryGirl.define do
  factory :ownership_registration do
    duration 3 
    paid false
    email_sent false
    association :dog
  end
end
