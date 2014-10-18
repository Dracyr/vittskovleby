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
    content { Faker::Lorem.paragraph }

    factory :page_with_children do
      transient { child_count 3 }
      after(:create) do |page, evaluator|
        create_list(:page, evaluator.child_count, parent: page)
      end
    end
  end
end
