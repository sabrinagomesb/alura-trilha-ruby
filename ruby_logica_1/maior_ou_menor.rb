def welcome_game
  puts "Bem vindo ao jogo da adivinhação!"
  puts "Qual é o seu nome?"
  name = gets
  puts "\n\n\n\n\n"
  puts "Começaremos o jogo para você, #{name}" 
  return name
end

def sort_random_number
  puts "Escolhendo um número secreto entre 0 e 200."
  random_number = rand(200)
  puts "Escolhido... Que tal adivinhar?"
  return random_number
end

def get_guess(player_guesses, guess, guesses_limit)
  puts "\n\n\n"
  puts "Tentativa #{guess.to_s} de #{guesses_limit.to_s}"  
  puts "Chutes até agora: #{player_guesses.to_s}" 
  puts "Digite o número"
  player_guess = gets
  puts "Será que acertou? Você chutou #{player_guess}" 
  return player_guess.to_i
end

def verify_result(player_name, secret_number, player_guess)
  success = secret_number == player_guess

  if success
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

player_name = welcome_game
secret_number = sort_random_number

total_score = 1000
guesses_limit = 5

player_guesses = []

for guess in 1..guesses_limit
  player_guess = get_guess(player_guesses, guess, guesses_limit)
  
  player_guesses << player_guess

  score_to_lose = (player_guess - secret_number).abs / 2.0
  total_score -= score_to_lose

  if verify_result(player_name, secret_number, player_guess)
    break
  end
end

puts "Você ganhou #{total_score}, #{player_name}"


# não é possível concatenar elementos de tipos diferntes.
