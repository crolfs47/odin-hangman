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
    puts 'Please input a filename to save your game:'
    gets.chomp
  end
end
