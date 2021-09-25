FactoryBot.define do
  factory :discussion_subscription do
    user { nil }
    discussion { nil }
    subscription_type { "MyString" }
  end
end
