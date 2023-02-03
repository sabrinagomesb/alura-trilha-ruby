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

  current_value = map[position[0]][position[1]]
  if current_value == "X" || current_value == "F"
    return false
  end
  true
end

def move_ghost(map, line, column)
  position = [line, column + 1]
  if is_position_valid? map, position
    map[line][column] = " "
    map[position[0]][position[1]] = "F"
  end
end

def ghosts_move map
  ghost_char = "F"
  map.each_with_index do |current_line, line|
    current_line.chars.each_with_index do | current_char, column |
      its_a_ghost = current_char == ghost_char
      if its_a_ghost
        move_ghost map, line, column
      end
    end
  end
end

def game(name)
  map = read_map 2
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

    ghosts_move map

  end
end

def start_game
  name = welcome_game
  game(name)
end
