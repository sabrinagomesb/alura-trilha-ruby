def welcome_game
  puts "Bem vinde ao jogo da forca!"
  puts "Qual é o seu nome"
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

def make_guess(guesses, error_count)
  puts "\n\n"
  puts "Erros até agora: #{error_count}"
  puts "Chutes até agora: #{guesses}"
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

def play(player_name)
  secret_word = choose_secret_word

  error_count = 0
  guesses = []
  score_so_far = 0

  while error_count < 5
    guess = make_guess(guesses, error_count)
    if guesses.include? guess
      puts "Você já chutou #{guess}"
      next
    end
    guesses << guess
    
    guess_letter = guess.size == 1
    if guess_letter
      find_letter = guess[0]
      found_letters_count = secret_word.count(find_letter)  
      if found_letters_count == 0
        puts "Letra não encontrada"
        error_count += 1
      else
        puts "Letra encontrada #{found_letters_count} vezes."
      end
    else 
      success = guess == secret_word
      if success
        puts "Parabéns! Você acertou!"
        score_so_far += 100
        break
      else
        puts "Que pena... você errou"
        score_so_far -= 30
        error_count += 1
      end
    end
  end

  puts "Você ganhou #{score_so_far} pontos."
end

player_name = welcome_game

loop do
  play(player_name) 
  if not_play_again
    break
  end
end
