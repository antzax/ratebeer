class Brewery < ApplicationRecord
  include RatingAverage

  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  validates :name, presence: true
  validates :year, numericality: { greater_than_or_equal_to: 1040, only_integer: true }
  validate :brewery_year_cannot_be_greater_than_current_year

  def print_report
    puts name
    puts "established at year #{year}"
    puts "number of beers #{beers.count}"
  end

  def restart
    self.year = 2022
    puts "Changed year to #{year}"
  end

  def brewery_year_cannot_be_greater_than_current_year
    return unless year > Time.now.year

    errors.add(:year, "can't be greater than #{Time.now.year}")
  end
end
