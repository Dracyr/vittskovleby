require 'faker'
FactoryGirl.define do

  factory :user do
    email { Faker::Internet.email }
    password "testtest"
    password_confirmation "testtest"
  end

  factory :page do
    title { Faker::Lorem.word.titleize }
    content { Faker::Lorem.paragraph }
  end

end
