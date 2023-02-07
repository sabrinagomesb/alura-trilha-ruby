def welcome_game
  puts "Bem vindo ao Pacman"
  puts "Qual é o seu nome?"
  name = gets.strip
  puts "\n\n\n" 
  puts "Prepare-se, #{name}"
  name
end

def draw_map(map)
  puts map
end

def ask_move
  puts "Para onde você quer ir?"
  gets.strip
end

def game_over
  puts "\n\n\n"
  puts "GAME OVER!"
end