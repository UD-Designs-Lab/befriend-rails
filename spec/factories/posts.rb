FactoryBot.define do
  factory :post do
    association :user, factory: :user
    body { 'hello world' }
    image { Rails.root.join('spec', 'factories', 'test_image', 'image.jpg') }
    reply_status { 'everyone' }
    uuid { 'lashiw135135' }

    trait :people_you_know do
      reply_status { 'people_you_know' }
    end

    factory :post_with_comments do
      transient do
        comments_count { 1 }
      end

      after(:create) do |post, evaluator|
        create_list(:comment, evaluator.comments_count, post: post)
        post.reload
      end
    end
  end
end
