require "active_support/concern"

module RatingAverage
  extend ActiveSupport::Concern

  included do
    def average
      return 0 if ratings.empty?

      ratings.sum { |r| r.score + r.score } / ratings.count.to_f
    end
  end
end
