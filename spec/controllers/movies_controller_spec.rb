require 'spec_helper'


FactoryGirl.define do
  factory :movie do
    title 'El rey Leon'    
    rating  'G'
    release_date { 10.years.ago }
    director 'Eve'
  end
end


# http://pastebin.com/C2x13z8M
describe MoviesController do
  describe 'Find movies by the same Director' do
    it 'shoud include rating and year' do
        movie = FactoryGirl.build(:movie)
    end
    # it 'should call the model method that perform search same director' do
    #     get :similar_movies, {id: 4}
    # end
    
  end
end