require 'rack'

class Album

  attr_reader :rank, :title, :year 

  def initialize(rank, title, year)
    @rank = rank
    @title = title
    @year = year
  end

end
