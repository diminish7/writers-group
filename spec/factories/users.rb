# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'password' }

    after(:build) do |user|
      user.password_confirmation ||= user.password
    end
  end
end
