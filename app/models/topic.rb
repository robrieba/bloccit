class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_one :rating, as: :rateable

  validates :name, length: { minimum: 5 }, presence: true
  validates :description, length: { minimum: 15 }, presence: true
  has_many :labelings, as: :labelable
  has_many :labels, through: :labelings

  scope :publicly_viewable, -> { where(public: true) }
  scope :privately_viewable, -> (user) { user ? where(public: false) : nil }

  scope :visible_to, -> (user) { user ? all : publicly_viewable }

end
