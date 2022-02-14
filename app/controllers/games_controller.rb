require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = []
    10.times do
      @letters << ('A'..'Z').to_a.sample
    end
  end

  def score
    @user_word = params['longword']
    url = "https://wagon-dictionary.herokuapp.com/#{@user_word}"
    word_serialized = URI.open(url).read
    word = JSON.parse(word_serialized)

    array = @user_word.split
    if array != nil
      @score = @user_word['length'] if (@letters - array).length == (@letters.length - @array.length) && word['found']
    end
  end
end
