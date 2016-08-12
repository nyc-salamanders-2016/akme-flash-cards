class Deck
  attr_reader :flashcard_arr, :correct_answers
  def initialize
    @flashcard_arr = []
    @correct_answers = 0
  end

  def load_flashcards(parsed_file_arr)
    parsed_file = parsed_file_arr.reject {|row| row.empty? }
    qa_arr = parsed_file.each_slice(2).to_a
    qa_arr.each do |qa_pair|
      qa_hash = {}
      qa_hash[:question] = qa_pair[0]
      qa_hash[:answer] = qa_pair[1]
      @flashcard_arr << Flashcard.new(qa_hash)
    end
    @flashcard_arr
  end

  def evaluate(object,user_response)
    if object.answer == user_response.downcase
      @correct_answers +=1
      "Correct!"
    else
      "Wrong!"
    end
  end

end
