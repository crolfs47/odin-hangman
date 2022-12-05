# file system module handles saving and loading games

module FileSystem
  def save_game
    Dir.mkdir('saved_games') unless Dir.exist?('saved_games')
    file_name = "saved_games/#{choose_file_name}.yaml"
    yaml_dump = YAML.dump(self)
    File.open(file_name, 'w') do |file|
      file.write yaml_dump
    end
    puts "You're game has been saved."
    @game_over = true
  end

  def choose_file_name
    puts 'Please input a file name to save your game:'
    file_name = gets.chomp
    if File.exist?("saved_games/#{file_name}.yaml")
      puts 'File name already exists.'
      choose_file_name
    else
      file_name
    end
  end

  def load_saved_game
    saved_game = choose_saved_game
    p saved_game
  end

  def choose_saved_game
    puts 'Please select the number of the game you would like to open:'
    saved_games = list_saved_games
    file_number = gets.chomp.to_i
    if file_number.between?(1, saved_games.length)
      saved_games[file_number - 1]
    else
      puts 'File number does not exist'
      choose_saved_game
    end
  end

  def list_saved_games
    saved_games = Dir.glob('*', base: 'saved_games')
    saved_games.each_with_index do |file, index|
      puts "(#{index + 1}) #{file}"
    end
  end
end
