class Post < ApplicationRecord
  include Helpers::DbHelper

  acts_as_votable

  before_create { generate_token(:uuid, Post) }

  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :favourites, as: :favouriteable, dependent: :destroy
  has_many :reposts, as: :repostable, dependent: :destroy

  validates_presence_of :body
  validates_length_of :body, maximum: 240

  enum reply_status: { everyone: 'everyone', people_you_know: 'people_you_know' }, _suffix: :can_reply

  default_scope -> { order(created_at: :desc) }

  scope :own_posts, ->(user) { where(user_id: user.id) }
  scope :from_people_you_follow, ->(user) { where(user_id: user.following.pluck(:id)) }
  scope :from_people_you_know, ->(user) { from_people_you_follow(user).or(own_posts(user)) }
  scope :consist_images, -> { where.not(image: nil) }
  scope :with_comments_from, ->(user) { includes(:comments).where(comments: { user_id: user.id }) }
end
