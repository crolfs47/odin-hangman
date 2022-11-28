class Game
  def initialize
    select_random_word
  end

  def play_game
  end

  def select_random_word
    word_list = []
    all_words = File.readlines('word-list.txt')
    all_words.each do |line|
      if line.strip.length >= 5 && line.strip.length <= 12
        word_list.push(line.strip)
      end
    end
    word = word_list.sample
    p word
  end
  
end
