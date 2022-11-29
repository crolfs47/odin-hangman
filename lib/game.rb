class Game
  def initialize
    puts 'Welcome to Hangman!'
    @guess_count = 10
    @game_over = false
    @word = select_random_word
    @guessed_word = ['_'] * @word.length
    @incorrect_guesses = []
    @correct_guesses = []
    play_game
  end

  def play_game
    p @word
    p @guessed_word.join
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
    check_game_over
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

  def evaluate_guess(letter)
    if @word.include?(letter)
      puts 'Good guess!'
      update_guessed_word(letter)
    else
      puts "Sorry, #{letter} is not in the word!"
      @guess_count -= 1
      puts "Incorrect guesses remaining: #{@guess_count}"
    end
  end

  def update_guessed_word(guess)
    @word.split('').each_with_index do |_letter, index|
      @guessed_word[index] = guess if guess == @word[index]
    end
    p @guessed_word
  end

  def check_game_over
    if @guess_count.zero?
      @game_over = true
      puts "You ran out of guesses! The word you were trying to guess was: #{@word}"
    end
  end
end
