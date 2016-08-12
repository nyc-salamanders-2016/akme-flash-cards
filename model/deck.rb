class Deck
  attr_reader :flashcard_arr, :correct_answers, :answered_flashcards
  def initialize
    @flashcard_arr = []
    @answered_flashcards = []
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

  def empty?
    @flashcard_arr.empty?
  end

  def next_card
   current_card = @flashcard_arr.shift
   answered_flashcards << current_card
   current_card
  end



  def evaluate(object,user_response)  # MOVE TO MODULE?
    if object.answer == user_response.downcase
      @correct_answers +=1
      "Correct!"
    else
      "Wrong!\n" + "The correct answer is '#{object.answer}'!"
    end
  end

end
