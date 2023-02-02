def alert_score(score_so_far)
  puts "Você ganhou #{score_so_far} pontos."
end

def alert_fail
  puts "Que pena... você errou"
end

def alert_congratulations
    puts "\nParabéns, você ganhou!"
		puts
		puts "       ___________      "
		puts "      '._==_==_=_.'     "
		puts "      .-\\:      /-.    "
		puts "     | (|:.     |) |    "
		puts "      '-|:.     |-'     "
		puts "        \\::.    /      "
		puts "         '::. .'        "
		puts "           ) (          "
		puts "         _.' '._        "
		puts "        '-------'       "
		puts
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
  puts "/********************/"
  puts "/  Jogo da Forca    */"
  puts "/********************/"
  puts "Qual é o seu nome?"
  name = gets.strip
  puts "\n\n\n"
  puts "Começaremos o jogo para você, #{name}"
  return name
end

def draw_hangman(error_count)
	head = "   "
	body = " "
	legs = "   "
	arms = "   "
	if error_count >= 1
		head = "(_)"
	end
	if error_count >= 2
		arms = " | "
		body = "|"
	end
	if error_count >= 3
		arms = "\\|/"
	end
	if error_count >= 4
		legs = "/ \\"
	end

	puts "  _______       "
	puts " |/      |      "
	puts " |      #{head}  "
	puts " |      #{arms}  "
	puts " |       #{body}     "
	puts " |      #{legs}   "
	puts " |              "
	puts "_|___           "
	puts 
 
end

def alert_choosing_secret_word
  puts "Escolhendo uma palavra secreta para você..."
end

def alert_choosed_secret_word(secret_word)
  puts "Palavra secreta com #{secret_word.size} letras. Boa sorte!"
end

def not_play_again
  puts "Deseja jogar novamente? (S/N)"
  wanna_play = gets.strip
  not_play_again = wanna_play.upcase == "N"  
end

def header_make_guess(guesses, error_count, mask)
  puts "\n\n"
  draw_hangman(error_count)
  puts "Palavra secreta: #{mask}"
  puts "Erros até agora: #{error_count}"
  puts "Chutes até agora: #{guesses}"
end

def make_guess
  puts "Entre com uma letra ou uma palavra"
  guess = gets.strip.downcase
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
      
def alert_total_score(total_score)
  puts "Valeu por jogar. Você fez #{total_score} pontos no total."  
end

def show_champ(data)
  puts "Nosso campeão atual é #{data[0]} com #{data[1]} pontos. "
end