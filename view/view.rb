
class View

  def load_file(file)
    deck_array = []
    File.foreach(file) do |line|
      deck_array << line.chomp
      end
    deck_array
  end


  def display_question(string)
    puts string
  end

  def get_user_answer
    gets.chomp
  end

  def display_evaluation(correct_or_wrong)
    puts correct_or_wrong
  end

  def display_final_result(correct_no, total_no)
    puts "You correctly answered #{correct_no} out of #{total_no} cards."
  end

end
