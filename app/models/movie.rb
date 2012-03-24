class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def similars  	    
    Movie.where("director = ? and id != ?", director, id)
    # debugger    
  end

end
