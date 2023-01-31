def alert_score(score_so_far)
  puts "Você ganhou #{score_so_far} pontos."
end

def alert_fail
  puts "Que pena... você errou"
end

def alert_congratulations
  puts "Parabéns! Você acertou!"
end

def alert_letter_found(found_letters_count)
  puts "Letra encontrada #{found_letters_count} vezes."
end

def alert_letter_not_found
  puts "Letra não encontrada"
end

def alert_guess(guess)
  puts "Você já chutou #{guess}"
end

def welcome_game
  puts "Bem vinde ao jogo da forca!"
  puts "Qual é o seu nome?"
  name = gets.strip
  puts "\n\n\n"
  puts "Começaremos o jogo para você, #{name}"
  return name
end

def choose_secret_word
  puts "Escolhendo uma palavra secreta para você..."
  secret_word = "programadora"
  puts "Palavra secreta com #{secret_word.size} letras. Boa sorte!"
  return secret_word
end

def not_play_again
  puts "Deseja jogar novamente? (S/N)"
  wanna_play = gets.strip
  not_play_again = wanna_play.upcase == "N"  
end

def header_make_guess(guesses, error_count, mask)
  puts "\n\n"
  puts "Palavra secreta: #{mask}"
  puts "Erros até agora: #{error_count}"
  puts "Chutes até agora: #{guesses}"
end

def make_guess
  puts "Entre com uma letra ou uma palavra"
  guess = gets.strip
  puts "Será que acertou? Você chutou #{guess}"
  return guess
end

def find_matches(word, letter)
  found_matches_count = 0
  for char in word.chars
    if char == letter
      found_matches_count += 1
    end
  end
  return found_matches_count
end