class User < ApplicationRecord
  acts_as_voter

  before_create do
    email.downcase!
    username.downcase!
  end

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :reposts, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_USERNAME_REGEX = /\A[a-z0-9_]+\z/i

  validates_presence_of :email
  validates_uniqueness_of :email, case_sensitive: false
  validates_length_of :email, maximum: 255
  validates_format_of :email, with: VALID_EMAIL_REGEX

  validates_length_of :password, minimum: 5, allow_blank: true

  validates_presence_of :username
  validates_uniqueness_of :username, case_sensitive: false
  validates_length_of :username, maximum: 30
  validates_format_of :username, with: VALID_USERNAME_REGEX

  validates_length_of :name, maximum: 50
  validates_length_of :bio, maximum: 160
  validates_length_of :location, maximum: 30
  validates_length_of :website, maximum: 100

  include Authentication
  include Filterable
  include Friendship

  def favourited?(object)
    favourites.map(&:favouriteable).include?(object)
  end

  def already_reposted?(object)
    reposts.map(&:repostable).include?(object)
  end
end
