class Rating < ActiveRecord::Base
  belongs_to :rateable, polymorphic: true

  enum severity: [ :PG, :PG13, :R ]

  def self.update_rating(rating_string)
    Rating.find_or_create_by(severity: rating_string.to_sym)
  end

end
