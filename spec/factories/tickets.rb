FactoryBot.define do
  factory :ticket do
    association :user
    association :event
    comment { "Example Comment" }
  end
end
