
require_relative "../view/view"
require 'pry'

class AkmeController

# initialize new view and deck (our model)
# deck = Deck.new

def initialize(ary)
  @view = View.new
  # @deck = Deck.new  # TBA
  deck_array = @view.load_file(ary[0])
  # run  # TBA
end


# get the file (from view)
# call parser (from deck), (which will turn into into an array of card objects)

# def run
#   p "run works!"
#   @deck.stuff
#   @view.display.question(string)
#   question_looper
#   evaluate_all
#   @view.display_final_result(correct_no, total_no)
# end

def question_looper

end


# loop through the arry in the deck:
  # call the display question (from view) to display upcoming question
  # call get user input (from view)
  # pass user input to evaluate (deck), which will return an answer
  # call display evaluation (from view)

# call evaluate_all answers (from deck)

# call print all answers (from view)



end
