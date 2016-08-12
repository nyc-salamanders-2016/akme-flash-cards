require_relative "../view/view"
require_relative "../model/deck"
require_relative "../model/flashcard"
require 'pry'

class AkmeController

  def initialize(filename)
    @view = View.new
    @deck = Deck.new
    flashcard_setup(filename)
    question_looper
  end

  def flashcard_setup(filename)
    deck_array = @view.load_file(filename)
    @deck.load_flashcards(deck_array)
  end

  def question_looper
    until @deck.empty?
      card = @deck.next_card
      @view.display_question(card.question)
      response = @view.get_user_answer
      correct_or_wrong = @deck.evaluate(card, response)
      @view.display_evaluation(correct_or_wrong)
    end
    display_result
  end

  def play_again
    @view.play_again
    @view.get_user_answer
  end

  def display_result
    @view.display_final_result(@deck.correct_answers,@deck.answered_flashcards.length)
  end

end

# suggestions for refaction from Sam:
# delegating the relevant logic to the relevant models. asking the question: "Whose job is this?"
  # should the card know whether it is completed?
# passing an already instantiated collection of cards to the deck
# module for parsing the file
# module for evaluating the answer
# shebang: be able to just say "./flashcards" to run your app
