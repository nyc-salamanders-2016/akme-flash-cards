class View

  def load_file(file)
    deck_array = []
    File.foreach(file) do |line|
      deck_array << line.chomp
      end
    deck_array
  end

  def display_question(string)
    system("clear")
    puts string
  end

  def get_user_answer
    response = STDIN.gets.chomp
  end

  def display_evaluation(correct_or_wrong)
    puts correct_or_wrong
    sleep(2)
  end

  def display_final_result(correct_no, total_no)
    system("clear")
    puts "You correctly answered #{correct_no} out of #{total_no} cards."
  end

  def ask_play_again
    puts "Do you want to play again? If so, type 'y'"
  end

end
