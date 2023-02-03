require_relative 'ui'

def read_map(number)
  file = "map_#{number}.txt"
  text = File.read file
  text.split "\n"
end

def find_player(map)
  hero_char = "O"
  map.each_with_index do |current_line, line|
    hero_column = current_line.index hero_char
    if hero_column
      return [line, hero_column]
    end
  end
end

def calc_hero_position hero, direction
  hero = hero.dup
  moves = {
    "W" => [-1, 0],
    "S" => [1, 0],
    "A" => [0, -1],
    "D" => [0, 1]
  }

  move = moves[direction] 
  hero[0] += move[0]
  hero[1] += move[1]
  hero
end

def is_position_valid?(map, position)
  lines = map.size
  columns = map[0].size
  
  border_line = position[0] < 0 || position[0] >= lines
  border_colummn = position[1] < 0 || position[1] >= columns

  if border_line || border_colummn
    return false
  end
  if map[position[0]][position[1]] == "X"
    return false
  end
  true
end

def game(name)
  map = read_map 1
  while true
    draw_map map
    direction = ask_move

    hero = find_player map
    new_position = calc_hero_position hero, direction
    
    if !is_position_valid? map, new_position
      next
    end

    map[hero[0]][hero[1]] = " "
    map[new_position[0]][new_position[1]] = "O"
  end
end

def start_game
  name = welcome_game
  game(name)
end
