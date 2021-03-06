FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    sequence(:username) { |n| "username#{n}" }
    sequence(:name) { |n| "name#{n}" }
    bio { "lorem ipsum color de matur" }
    location { "India" }
    website { "https://localhost:3000" }
    password { "mamakane" }

    factory :random_user do
      sequence(:email) { |n| "user#{n}@random.com" }
    end

    factory :user_with_posts do
      transient do
        posts_count { 1 }
      end

      after(:create) do |user, evaluator|
        create_list(:post, evaluator.posts_count, user: user)
        user.reload
      end
    end
  end
end
