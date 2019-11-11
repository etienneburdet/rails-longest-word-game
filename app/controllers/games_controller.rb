require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = [];
    10.times { @letters << ('a'..'z').to_a[rand(0..25)]}
    @grid = @letters.join
  end

  def score
    letters = params[:grid].split('')
    answer_letters = params[:answer].split('')
    url = "https://wagon-dictionary.herokuapp.com/#{params[:answer]}"
    dictionnary_serialized = open(url).read
    dictionnary_answer = JSON.parse(dictionnary_serialized)['found']

    @check = if !(answer_letters - letters).empty?
               'Word is impossible with grid'
             elsif !dictionnary_answer
               "Word doesn't exist"
             else
               'Score'
             end
  end
end
