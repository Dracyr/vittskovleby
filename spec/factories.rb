require 'faker'
FactoryGirl.define do

  sequence :title do
    Faker::Lorem.word.titleize
  end

  factory :reservation do
    location "MyString"
    name "MyString"
    phone "MyString"
    email "MyString"
    comment "MyText"
  end

  factory :editable_field do
    title
    content { Faker::Lorem.paragraph }
  end

  factory :user do
    email { Faker::Internet.email }
    password "testtest"
    password_confirmation "testtest"
    role :user
    factory :admin do
      role :admin
    end
  end

  factory :event do
    title
    date { Time.current }
    content { Faker::Lorem.paragraph }
  end

  factory :page do
    title
    permalink { title.parameterize }
    content { Faker::Lorem.paragraph }
    factory :page_with_menu do
      association :menu, factory: :menu
    end
  end

  factory :menu do
    title
    menu_type 0
  end
end
