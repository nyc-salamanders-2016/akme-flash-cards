require_relative 'flashcard'

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

# deck = Deck.new
# deck.load_flashcards(
# ["What is a male raccoon called?", "boar", "", "What is a female raccoon called?", "sow", "", "Are raccoons herbivorous, carnivorous, or omnivorous?", "omnivorous", "", "True or false?  Raccoons are nocturnal.", "true", "", "True or false?  Raccoons hibernate.", "false", "", "True or false?  Raccoons can run at speeds up to 15 miles per hour.", "true"])
# puts deck.flashcard_arr
# p deck.evaluate(deck.flashcard_arr[0], "boo")
# p deck.evaluate(deck.flashcard_arr[1], "sow")
