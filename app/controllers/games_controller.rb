class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @grid_letters = []
    params[:random_letters].split(' ').each do |letter|
      @grid_letters << letter if params[:word].upcase.split('').include?(letter)
    end
    @grid_letters.sort!
    @user_letters = params[:word].upcase.split('').sort!
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    user_serialized = open(url).read
    @user = JSON.parse(user_serialized)
  end
end
