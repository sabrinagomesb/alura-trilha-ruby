def welcome_game
  puts "Bem vindo ao jogo da adivinhação!"
  puts "Qual é o seu nome?"
  name = gets
  puts "\n\n\n\n\n"
  puts "Começaremos o jogo para você, " + name
  return name
end

def sort_random_number
  puts "Escolhendo um número secreto entre 0 e 200."
  random_number = 175
  puts "Escolhido... Que tal adivinhar?"
  return random_number
end

def get_guess(guess, guesses_limit)
  puts "\n\n\n"
  puts "Tentativa " + guess.to_s + " de " + guesses_limit.to_s
  puts "Digite o número"
  player_guess = gets
  puts "Será que acertou? Você chutou " + player_guess
  return player_guess.to_i
end

def verify_result(player_name, secret_number, player_guess)
  success = secret_number == player_guess

  if success
    puts "Parabéns, " + player_name + "Você acertou!"
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

guesses_limit = 5

for guess in 1..guesses_limit
  player_guess = get_guess(guess, guesses_limit)
  
  if verify_result(player_name, secret_number, player_guess)
    break
  end
end


# não é possível concatenar elementos de tipos diferntes.
