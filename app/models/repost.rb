class Repost < ApplicationRecord
  include Helpers::DbHelper

  acts_as_votable

  before_create { generate_token(:uuid, Repost) }

  belongs_to :repostable, polymorphic: true
  belongs_to :user
  has_many :reposts, as: :repostable, dependent: :destroy
  has_many :favourites, as: :favouriteable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  validates_length_of :body, maximum: 240

  default_scope { order(created_at: :desc) }

  scope :own_reposts, ->(user) { where(user_id: user.id) }
  scope :from_people_you_follow,
    ->(user) { where(user_id: user.following.pluck(:id)) }
  scope :from_people_you_know,
    ->(user) { from_people_you_follow(user).or(own_reposts(user)) }
  scope :reposts_count, -> { where(body: nil).count }
  scope :quote_posts_count, -> { where.not(body: nil).count }
end
