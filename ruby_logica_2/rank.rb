def save_hank(player_name, total_score)
  container = "#{player_name}\n#{total_score}"
  File.write "rank.txt", container
end

def show_rank
  container = File.read "rank.txt"
  container.split "\n"
end