require_relative 'ui'

def read_map(number)
  file = "map_#{number}.txt"
  text = File.read file
  text.split "\n"
end

def find_player(map)
  hero = "O"
  map.each_with_index do |current_line, index|
  hero_column = current_line.index hero
    if hero_column
      return [index, hero_column]
    end
  end
end

def game(name)
  map = read_map 1

  while true
    draw_map map
    direction = ask_move
    hero = find_player map
    map[hero[0]][hero[1]] = " "
    case direction
    when "W"
      hero[0] -= 1
    when "S"
      hero[0] += 1
    when "D"
      hero[1] += 1
    when "A"
      hero[1] -= 1
    end
    map[hero[0]][hero[1]] = "O"
  end
end

def start_game
  name = welcome_game
  game(name)
end
