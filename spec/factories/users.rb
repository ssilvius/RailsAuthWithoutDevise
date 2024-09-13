FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { "password" }
    password_confirmation { "password" }
    email_validated { false }
    cookies_accepted { false }

    trait :validated_email do
      email_validated { true }
      email_validated_at { Timecop.freeze(Time.now.utc.iso8601) }
    end

    trait :accepted_cookies do
      cookies_accepted { true }
      cookies_accepted_at { Timecop.freeze(Time.now.utc.iso8601) }
    end
  end
end
