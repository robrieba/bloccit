class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  default_scope { order('created_at DESC') }
  scope :ordered_by_title, -> { unscoped.order('title') }
  scope :ordered_by_reverse_created_at, -> { unscoped.order('created_at ASC') }

end
