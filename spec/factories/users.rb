require 'faker'
FactoryGirl.define do
  factory :user do |f|
    email { Faker::Internet.email  }
    username { Faker::Internet.user_name}
    password "password"
    password_confirmation "password"
    roles [:user]
  end

  factory :admin, class: User do |f|
    email { Faker::Internet.email  }
    username { Faker::Internet.user_name}
    password "password"
    password_confirmation "password"
    roles [:admin]
  end
end
