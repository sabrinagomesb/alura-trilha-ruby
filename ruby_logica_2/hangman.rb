require_relative 'user_interface'
# ELA RETORNE UMA STRING COM MASCARA
def mask_word(guesses, secret_word)
  mask = ""
  for letter in secret_word.chars
    mask << " "
    if guesses.include? letter
      mask << letter
    else
      mask << "_"
    end
  end
  return mask
end

def ask_valid_guess(guesses, error_count, mask)
  header_make_guess(guesses, error_count, mask)
  loop do
    guess = make_guess
    if guesses.include? guess
      alert_guess(guess)
    else
      return guess
    end
  end
end

def play(player_name)
  secret_word = choose_secret_word
  error_count = 0
  guesses = []
  score_so_far = 0

  while error_count < 5
    mask = mask_word(guesses, secret_word)
    guess = ask_valid_guess(guesses, error_count, mask)
    guesses << guess
    guess_letter = guess.size == 1
    if guess_letter
      find_letter = guess[0]
      found_letters_count = secret_word.count(find_letter)  
      if found_letters_count == 0
        alert_letter_not_found
        error_count += 1
      else
        alert_letter_found(found_letters_count)
      end
    else 
      success = guess == secret_word
      if success
        alert_congratulations
        score_so_far += 100
        break
      else
        alert_fail
        score_so_far -= 30
        error_count += 1
      end
    end
  end
  alert_score(score_so_far)
end

def hangman_game
  player_name = welcome_game
  loop do
    play(player_name) 
    if not_play_again
      break
    end
  end
end

