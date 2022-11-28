class Game
  def initialize
    puts 'Welcome to Hangman!'
    @guess_count = 10
    @game_over = false
    @word = select_random_word
    @incorrect_guesses = []
    play_game
  end

  def play_game
    p @word
    take_turn until @game_over
  end

  def select_random_word
    word_list = []
    all_words = File.readlines('word-list.txt')
    all_words.each do |line|
      word_list.push(line.strip) if line.strip.length >= 5 && line.strip.length <= 12
    end
    @word = word_list.sample
  end

  def take_turn
    guess = guess_letter
    evaluate_guess(guess)
  end

  def guess_letter
    puts 'Please enter a letter:'
    guess = gets.chomp
    if guess.length == 1 && guess.downcase.match(/^[a-z]$/)
      guess.downcase
    else
      puts 'Please input only one letter'
      guess_letter
    end
  end

  def evaluate_guess(letter); end
end
