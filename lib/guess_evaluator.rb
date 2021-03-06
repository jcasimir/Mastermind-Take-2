require_relative 'codemaker'

class GuessEvaluator
  attr_reader :guess, :secret_code

  def initialize(guess, secret_code)
    @guess = guess
    @secret_code = secret_code
  end

  def correct_colors
    duplicate = secret_code.dup
    guess.each do |color|
      if duplicate.include?(color)
        duplicate.delete(color)
      end
    end
    4 - duplicate.length
  end

  # This was unnecessary; trying to account for duplicates
  # Don't need to. Refer to specs

  # def correct_colors
  #   correct = 0
  #   guess = @guess.dup
  #   answer = secret_code
  #   answer.each do |color|
  #     if guess.include?(color)
  #       guess.delete_at(guess.index(color))
  #       correct += 1
  #     end
  #   end
  #   correct
  # end

  def correct_positions
    counter = 0
    combined = guess.zip(secret_code)
    combined.select do |code, turn|
      if code == turn
        counter += 1
      end
    end
    counter
  end
end

c = GuessEvaluator.new(["r","g","y","y"], ["r","b","g","g"])
c.correct_colors
c.correct_positions
