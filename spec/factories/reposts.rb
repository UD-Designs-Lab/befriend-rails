FactoryBot.define do
  factory :repost do
    user
    body { 'Repostable post' }
    uuid { 'awgh3t3t3' }
    for_post

    trait :for_post do
      association :repostable, factory: :post
    end

    trait :for_comment do
      association :repostable, factory: :comment
    end
  end
end
