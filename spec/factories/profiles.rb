require 'faker'
FactoryGirl.define do
  factory :profile do |f|
  	first_name { Faker::Name.first_name }
  	middle_name { Faker::Name.first_name }
  	last_name { Faker::Name.last_name }
  	street { Faker::Address.street_address }
  	suburb { Faker::Address.city}
  	town_city { Faker::Address.city }
  	postcode { Faker::Address.postcode }
  	association :user 
  end
end
