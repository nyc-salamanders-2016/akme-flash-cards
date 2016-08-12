
require_relative "../view/view"
require_relative "../model/deck"
require_relative "../model/flashcard"
require 'pry'

class AkmeController

  def initialize(ary)
    @view = View.new
    @deck = Deck.new
    deck_array = @view.load_file(ary[0])
    @deck.load_flashcards(deck_array)
    question_looper
    display_result
  end

  def question_looper
    @deck.flashcard_arr.each do |flashcard|
        @view.display_question(flashcard.question)
        response = @view.get_user_answer
        correct_or_wrong = @deck.evaluate(flashcard, response)
        @view.display_evaluation(correct_or_wrong)
     end
  end

  def display_result
    @view.display_final_result(@deck.correct_answers,@deck.flashcard_arr.length)
  end

end
