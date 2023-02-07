class Hero
  attr_accessor :line, :column

  def calc_hero_position(direction) 
  new_hero = dup
  moves = {
    "W" => [-1, 0],
    "S" => [1, 0],
    "A" => [0, -1],
    "D" => [0, 1]
  }

  move = moves[direction] 
  new_hero.line += move[0]
  new_hero.column += move[1]
  new_hero
  end

  def to_array
    [line, column]
  end

  def remove_from(map)
    map[line][column] = " "
  end
  
  def puts_on(map)
    map[line][column] = "O"
  end
end