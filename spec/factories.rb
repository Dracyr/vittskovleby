require 'faker'
FactoryGirl.define do

  factory :user do
    email { Faker::Internet.email }
    password "testtest"
    password_confirmation "testtest"
    role :admin
  end

  factory :page do
    title { Faker::Lorem.word.titleize }
    content { Faker::Lorem.paragraph }
  end

end
