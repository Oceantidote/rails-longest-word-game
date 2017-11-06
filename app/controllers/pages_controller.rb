require 'open-uri'
require 'json'
# require 'pry'

class PagesController < ApplicationController

  def score
    @start_time = params[:start_time].to_i
    @end_time = Time.now.to_f
    @word = params[:user_guess]
    @grid = params[:grid]


    def word_check(word)
      result = "https://wagon-dictionary.herokuapp.com/#{word}"
      result_readable = open(result).read
      final_result = JSON.parse(result_readable)
      final_result
    end

    def calculate_score(attempt, start_time, end_time)
      attempt.length / (end_time - start_time)
    end

    def in_grid?(attempt, grid)
      letters = attempt.upcase.split("")
      letters.all? { |letter| attempt.upcase.count(letter) <= @grid.count(letter) }
    end

    def run_game(attempt, grid, start_time, end_time)
      if !word_check(attempt)["found"]
        { message: "Not an english word", score: 0 }
      elsif !in_grid?(attempt, grid)
        { message: "Not in the grid", score: 0 }
      else
        score = calculate_score(attempt, start_time, end_time)
        final_score = (score * 10000000000).to_i
        { message: "Well done", score: final_score }
      end
    end

    @message = run_game(@word, params[:grid], @start_time, @end_time)

  end

  def guess
    alphabet = ("a".."z").to_a
    generated_grid = []
    10.times do
      generated_grid << alphabet.sample.upcase
    end
    @generated_grid = generated_grid
  end

end





