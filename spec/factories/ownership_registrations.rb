FactoryGirl.define do
  factory :ownership_registration do
    duration 1
    paid false
    email_sent false
    association :dog
  end
end
