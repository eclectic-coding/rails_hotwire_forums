FactoryBot.define do
  factory :discussion do
    name { "MyString" }
    pinned { false }
    closed { false }
    user { nil }
  end
end
