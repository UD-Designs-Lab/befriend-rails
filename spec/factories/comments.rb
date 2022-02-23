FactoryBot.define do
  factory :comment do
    user
    content { "hello world, all the comments" }
    association :commentable, factory: :post
  end
end
