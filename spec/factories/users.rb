FactoryBot.define do
  factory :user do
    sequence(:provider) { |n| "provider#{n}" }
    sequence(:uid) { |n| "uid#{n}" }
    sequence(:name) { |n| "User#{n}" }
    image_url { "https://bootcamp.fjord.jp/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBNTFBQXc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--5cdb8a87bb988d19f433cfae4e5909dbadc76b19/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%202023-11-02%2022.37.16.png" }
  end
end
