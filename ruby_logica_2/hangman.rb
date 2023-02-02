require_relative 'user_interface'
require_relative 'rank'

def choose_secret_word
  alert_choosing_secret_word
  text = File.read("dictionary.txt")
  all_words = text.split "\n"
  random_number = rand(all_words.size)
  secret_word = all_words[random_number].downcase
  alert_choosed_secret_word(secret_word)
  return secret_word
end

def choose_secret_word_with_performace
  alert_choosing_secret_word
  file = File.new("dictionary.txt")
  total_words = file.gets.to_i
  random_number = rand(total_words)
  for line in 1.. (random_number-1)
    file.gets
  end
  secret_word = file.gets.strip.downcase
  file.close
  alert_choosed_secret_word(secret_word)
  return secret_word
end


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
  secret_word = choose_secret_word_with_performace
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
  return score_so_far
end

def hangman_game
  player_name = welcome_game
  total_score = 0

  show_champ(show_rank)

  loop do
    total_score += play(player_name)
    if show_rank[1].to_i < total_score
      save_hank(player_name, total_score)
    end
    if not_play_again
      alert_total_score(total_score)
      break
    end
  end
end

