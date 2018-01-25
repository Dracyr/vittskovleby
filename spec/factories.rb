require 'faker'
FactoryBot.define do

  sequence :title, aliases: [:name] do
    Faker::Lorem.word.titleize
  end
  sequence :content do
    Faker::Lorem.paragraph
  end

  factory :reservation do
    name
    phone "1234567"
    email "test@example.com"
    comment { Faker::Lorem.paragraph }
    date { Date.today }
    approved false

    after(:build) do |reservation|
      reservation.locations << build(:location)
    end

    factory :approved_reservation do
      approved true
    end
  end

  factory :location do
    name
  end

  factory :editable_field do
    title
    content
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
    start_time { Time.current }
    content
  end

  factory :page do
    title
    permalink { title.parameterize }
    content
    factory :page_with_menu do
      association :menu, factory: :menu
    end
  end

  factory :menu do
    title
    menu_type 0
  end
end
