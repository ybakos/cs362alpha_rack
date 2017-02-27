require 'rack'

class Album

  attr_reader :rank, :title, :year 

  def initialize(rank, title, year)
  	raise ArgumentError.new("Title cannot be empty") if title.empty?
  	raise ArgumentError.new("Rank cannot be a non integer") if rank.to_i.is_a?(String)
    raise ArgumentError.new("Rank cannot be less than 1") if rank.to_i < 1
    raise ArgumentError.new("Rank cannot be greater than 100") if rank.to_i > 100

    current_year = Time.new.year.to_i
    raise ArgumentError.new("Year cannot be greater than the current year") if year.to_i > current_year

    @rank = rank
    @title = title
    @year = year
  end

end
