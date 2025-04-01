require "active_support/concern"

module Statistics
  extend ActiveSupport::Concern

  included do
    def average
      return "No rating" if self.ratings.empty?
      self.ratings.average(:score)
    end
  end
end
