FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "123456" }
    password_confirmation { "123456" }

    factory :admin_user do
      admin { true }
    end
  end
end
