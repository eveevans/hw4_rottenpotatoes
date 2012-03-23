# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.    
    Movie.create!(movie)
  end
  #Movie.create!(movies_table.hashes)  
  # assert false, "Unimplmemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  assert false, "Unimplmemented"
end

Then /I should see all of the movies/ do
  # ma = Movie.all.count
  # puts rows  
  #puts page.has_css?("table tbody tr", :count => Movie.all.count)
  #page.should have_css("table#mytable tr", :count=>3)
  #page.all('table tbody tr').count.should == 1
   assert_equal page.all('table tbody tr').count, Movie.all.count
end

Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |nombre_pelicula, director|
  peli  = Movie.find_by_title(nombre_pelicula)
  #peli.director.should 
  assert_match(peli.director, director)
end

# And   I should see "'Alien' has no director info"
# And   /I should see "(.+) has no director info"/ do |nombre_pelicula| 
#   assert true, "Unimplmemented"
# end



# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  pelis = rating_list.split
  # puts pelis 
  pelis.each do |r|
    tmp = "ratings[#{r.match(/(\w)+(-\d+)?/)}]"
    #puts tmp    
    if (uncheck).blank?      
      step %{I check "#{tmp}"}
      #puts %{I check "#{tmp}"}
    else
      step %{I uncheck "#{tmp}"}
      #puts %{I uncheck "#{tmp}"}
    end

  end
  
end
