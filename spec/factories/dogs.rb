FactoryGirl.define do
  factory :dog do
    #Oh no, I'm not a cat T_T
    name { Faker::Cat.name } 
    breed { Faker::Cat.breed } 
    date_of_birth_on { Faker::Date.birthday(0,15) }
    association :user 
  end
end
