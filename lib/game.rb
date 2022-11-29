# game class initializes the game and handles the game logic

require_relative 'display'

class Game
  include Display

  def initialize
    display_instructions
    @guess_count = 8
    @game_over = false
    @word = select_random_word
    @guessed_word = ['_'] * @word.length
    @guessed_letters = []
    play_game
  end

  def play_game
    # p @word
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
    @guessed_letters.push(guess)
    evaluate_guess(guess)
    check_game_over
    display_guessed_word(@guessed_word)
    display_guesses_remaining(@guess_count) unless @game_over
    display_guessed_letters(@guessed_letters) unless @game_over
  end

  def guess_letter
    puts 'Please enter a letter:'
    guess = gets.chomp
    if guess.length == 1 && guess.downcase.match(/^[a-z]$/) && !@guessed_letters.include?(guess)
      guess.downcase
    else
      puts "Please input only one letter that you haven't already guessed"
      guess_letter
    end
  end

  def evaluate_guess(letter)
    puts ''
    if @word.include?(letter)
      puts 'Good guess!'
      update_guessed_word(letter)
    else
      puts "Sorry, #{letter} is not in the word!"
      @guess_count -= 1
    end
  end

  def update_guessed_word(guess)
    @word.split('').each_with_index do |_letter, index|
      @guessed_word[index] = guess if guess == @word[index]
    end
  end

  def check_game_over
    if @guess_count.zero?
      @game_over = true
      display_loser(@word)
    end
    if @guessed_word.join == @word
      @game_over = true
      display_winner
    end
  end
end
