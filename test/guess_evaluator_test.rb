
require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess_evaluator'

class GuessEvaluatorTest < Minitest::Test

  def test_player_guess_no_matches
    guess = %w(r g y y)
    secret_code = ["b","b","b","b"]
    evaluator = GuessEvaluator.new(guess, secret_code)
    assert_equal 0, evaluator.correct_colors
  end

  def test_player_guesses_one_color_correct
    guess = ["r","g","y","y"]
    secret_code =  ["r","b","b","b"]
    evaluator = GuessEvaluator.new(guess, secret_code)
    assert_equal 1, evaluator.correct_colors
  end

  def test_player_guess_match_one_color_and_one_position
    guess = ["r","g","y","y"]
    secret_code =  ["r","b","b","b"]
    evaluator = GuessEvaluator.new(guess, secret_code)
    assert_equal 1, evaluator.correct_colors
    assert_equal 1, evaluator.correct_positions
  end

  def test_player_guess_match_two_colors_and_one_position
    guess = ["r","g","y","y"]
    secret_code =  ["r","b","g","b"]
    evaluator = GuessEvaluator.new(guess, secret_code)
    assert_equal 2, evaluator.correct_colors
    assert_equal 1, evaluator.correct_positions
  end

  def test_player_guess_match_three_colors_and_one_position
    guess = ["r","g","y","y"]
    secret_code  = ["r","b","g","g"]
    evaluator = GuessEvaluator.new(guess, secret_code)
    assert_equal 3, evaluator.correct_colors
    assert_equal 1, evaluator.correct_positions
  end

  def test_player_guess_matches_secret_colors
    guess = ["r","g","b","y"]
    secret_code  = ["r","g","b","y"]
    evaluator = GuessEvaluator.new(guess, secret_code)
    assert guess == secret_code
  end
end
