require 'faker'
FactoryGirl.define do
  factory :address do |f|
  	street { Faker::Address.street_address }
  	suburb { Faker::Address.city}
  	town_city { Faker::Address.city }
  	postcode { Faker::Address.postcode }
  	association :user 
  end
end
