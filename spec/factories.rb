require 'faker'
FactoryGirl.define do

  sequence :title do
    Faker::Lorem.words.join(' ').titleize
  end

  factory :user do
    email { Faker::Internet.email }
    password "testtest"
    password_confirmation "testtest"
    role :admin
  end

  factory :post do
    title
    content { Faker::Lorem.paragraph }
  end

  factory :page do
    title
    permalink { title.parameterize }
    content { Faker::Lorem.paragraph }
  end

  factory :menu do
    title
  end
end
