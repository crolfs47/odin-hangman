# display module handles methods for displaying wordy text content

module Display
  def display_instructions
    puts 'Welcome to Hangman!'
    puts 'The computer randomly selected a word between 5 and 12 characters long.'
    puts 'Guess the word before you run out of incorrect guesses to win!'
  end

  def display_game_option
    puts 'Would you like to start a new game or load a saved game?'
    puts '(1) Start a new game'
    puts '(2) Load a saved game'
  end

  def display_guessed_word(guessed_word)
    puts "#{guessed_word.join(' ')}"
  end

  def display_guesses_remaining(guess_count)
    puts "Incorrect guesses remaining: #{guess_count}"
  end

  def display_guessed_letters(guessed_letters)
    puts "Letters already guessed: #{guessed_letters.join(' ')}\n\n"
  end

  def display_game_board
    display_guessed_word(@guessed_word) unless @game_over
    display_guesses_remaining(@guess_count) unless @game_over
    display_guessed_letters(@guessed_letters) unless @game_over
  end

  def display_loser(word)
    puts "You ran out of guesses! The word you were trying to guess was: #{word.upcase}."
  end

  def display_winner(word)
    puts "You win! You correctly guessed the word: #{word.upcase}."
  end
end
