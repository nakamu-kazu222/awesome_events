FactoryBot.define do
  factory :event do
    name { "Rock Live" }
    place  { "Tokyo" }
    content { "Summer Event" }
    start_at { Time.now }
    end_at { Time.now + 1.hour }
    owner { association(:user) }
  end
end
