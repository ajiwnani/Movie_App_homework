class Movie < ActiveRecord::Base

	validates :title, :description, :year_released, presence: true
  	validates :description, length: { minimum: 10 }
  	validates :year_released, numericality: /\A[+-]?\d+\Z/

  def self.search_for(query)
    Movie.where("name LIKE :query OR description LIKE :query", {:query => "%#{query}%"})
  end

end
