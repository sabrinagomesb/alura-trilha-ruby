def won
  puts
  puts "             OOOOOOOOOOO               "
  puts "         OOOOOOOOOOOOOOOOOOO           "
  puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
  puts "    OOOOOO      OOOOO      OOOOOO      "
  puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
  puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
  puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
  puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
  puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
  puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
  puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
  puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
  puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
  puts "         OOOOOO         OOOOOO         "
  puts "             OOOOOOOOOOOO              "
  puts
  puts "               Acertou!                "
  puts
end

# função de boas vindas e retorna o nome do player
def welcome_game
  puts
  puts "        P  /_\  P                              "
  puts "       /_\_|_|_/_\                             "
  puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
  puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!"
  puts "  |' '  |  |_|  |'  ' |                        "
  puts "  |_____| ' _ ' |_____|                        " 
  puts "        \__|_|__/                              "
  puts
  puts "Bem vindo ao jogo da adivinhação!"
  puts "Qual é o seu nome?"
  name = gets
  puts "\n\n\n"
  puts "Começaremos o jogo para você, #{name}" 
  return name.strip
end

# função que pergunta o nivel e retorna ele em numero inteiro
def ask_level
  puts "Qual o nível de dificuldade?"
  puts "(1) Muito fácil (2) Fácil (3) Normal (4) Difícil (5) Impossível"
  puts "Escolha: "
  level = gets.to_i
end

# função que sorteia e retorna número aleatório de acordo com o level escolhido pelo usuário
def sort_random_number(level)
  # variaveis definidas dentro de if / for / case podem ser acessadas dentro da função
  case level
  when 1
    max = 30
  when 2
    max = 60
  when 3
    max = 100
  when 4
    max = 150
  else
    max = 200
  end
  puts "Escolhendo um número secreto entre 1 e #{max}..."
  random_number = rand(max) + 1
  puts "Escolhido... Que tal adivinhar?"
  return random_number
end

# função que captura e retorna o palpite do jogador
def get_guess(player_guesses, guess, guesses_limit)
  puts "\n\n\n"
  puts "Tentativa #{guess.to_s} de #{guesses_limit.to_s}"  
  puts "Chutes até agora: #{player_guesses.to_s}" 
  puts "Digite o número"
  player_guess = gets
  puts "Será que acertou? Você chutou #{player_guess}" 
  return player_guess.to_i
end

# função que verifica o resultado e retorna um valor boleano
def verify_result(player_name, secret_number, player_guess)
  success = secret_number == player_guess

  if success
    won
    puts "Parabéns, #{player_name.strip}! Você acertou!"
    return true
  end

  greater = secret_number > player_guess

  if greater
    puts "O número secreto é maior."
  else
    puts "O número secreto é menor"
  end
  return false
end

# função que executa o jogo utilizando nome e level do player
def play(player_name, level)
  secret_number = sort_random_number(level)
  # hard coded / numeros magicos
  total_score = 1000
  guesses_limit = 5

  player_guesses = []

  for guess in 1..guesses_limit
    player_guess = get_guess(player_guesses, guess, guesses_limit)
      # push
    player_guesses << player_guess

    score_to_lose = (player_guess - secret_number).abs / 2.0
    total_score -= score_to_lose

    if player_name == "Sabrina"
      won
      puts "Parabéns, #{player_name}! Você acertou!"
      break
    end

    if verify_result(player_name, secret_number, player_guess)
      break
    end
  end
  puts "#{player_name}, você conseguiu #{total_score} pontos. "
end

# função que pergunta se o jogar quer jogar novamente e retorna um valor boleano.
def not_play_again
  puts "Deseja jogar novamente? (S/N)"
  wanna_play = gets.strip
  wanna_play.upcase == "N"
end

player_name = welcome_game
level = ask_level

loop do
  play(player_name, level)
  if not_play_again
    break
  end
end


# não é possível concatenar elementos de tipos diferntes.
