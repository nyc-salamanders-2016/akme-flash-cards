

class AkmeController

# initialize new view and deck (our model)

view = View.new
deck = Deck.new

# get the file (from view)



# call parser (from deck), (which will turn into into an array of card objects)

# loop through the arry in the deck:
  # call the display question (from view) to display upcoming question
  # call get user input (from view)
  # pass user input to evaluate (deck), which will return an answer
  # call display evaluation (from view)

# call evaluate_all answers (from deck)

# call print all answers (from view)



end
