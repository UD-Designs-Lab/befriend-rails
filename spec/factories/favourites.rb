FactoryBot.define do
  factory :favourite do
    user factory: :user

    trait :for_post do
      association :favouriteable, factory: :post
    end

    trait :for_comment do
      association :favouriteable, factory: :comment
    end
  end
end
