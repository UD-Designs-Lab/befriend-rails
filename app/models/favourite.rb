class Favourite < ApplicationRecord
  belongs_to :favouriteable, polymorphic: true
  belongs_to :user

  default_scope -> { order(created_at: :desc) }
end
