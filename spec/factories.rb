FactoryGirl.define do
  factory :user do
    name "Bryan"
    sequence(:username) { |n| "bricker-#{n}" }
    sequence(:email) { |n| "bricker-#{n}@scpr.org" }
    password "secret"
    password_confirmation { password }
  end

  factory :post do
    headline "Post"
    body "Post Body"
  end
end
