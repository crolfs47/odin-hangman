# display module handles methods for displaying text content

module Display
  def display_guessed_word(guessed_word)
    puts "#{guessed_word.join(' ')}"
  end

  def display_guesses_remaining(guess_count)
    puts "Incorrect guesses remaining: #{guess_count}\n\n"
  end

  def display_loser(word)
    puts "You ran out of guesses! The word you were trying to guess was: #{word}."
  end

  def display_winner
    puts 'You win! You correctly guessed the word:'
  end
end
