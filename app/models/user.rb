class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  after_initialize :set_default_role, if: :new_record?

  validates :name, presence: true
  validates :postsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  enum role: { user: 'user', admin: 'admin' }

  def admin?
    role == 'admin'
  end

  def most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  private

  def set_default_role
    self.role ||= :user
  end
end
