# Ruby Flashcards 1 Single Deck 
 
##Learning Competencies 

* Create well-defined classes with a single responsibility
* Identify and implement classes based on real world requirements
* Implement clean and flexible interfaces between objects
* Create interactive command-line applications with data persistence

##Summary 

Let's build a simple flashcard game in Ruby with a command-line interface.  Here is an example of one possible implementation:

```text
$ ruby flashcards.rb
Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition.  Ready?  Go!
 
Definition
A file format in which values are delimited by commas.

Guess: YAML
Incorrect!  Try again.

Guess: XML
Incorrect!  Try again.

Guess: CSV
Correct!

Definition
(and so on)
```

##Releases

###Release 0 : Design

####Choose Your Data Model and Control Flow

You might already have a clear picture of how to design your program, but it is always a good idea to articulate your concept using pseudocode, wireframes, or another modeling tool.  You should be able to draw or write out a rough sketch of both the **data model** and the **control flow** of the program.

This stage should take at most 15-20 minutes.  If you're spending more than that, find a staff member to get you unstuck.

Some questions to consider:

- Do you fully understand the logic of the game?
- What classes (state and behavior) do you need?
- What are the responsibilities of each class?  Are they single responsibilities?
- Which methods should be public?  Which should be private?

Once you have a plan in place, create the skeletal file structure for your app.

Find a staff member or another student and get their opinion on your overall structure.

#### Cards in a file

The next step is to answer the question of where the cards will come from.  Provided in the gist is a file called `sample_cards.txt`, which demonstrates a supremely basic way to store the card data (definition on one line, term on the next, and then a blank line to separate the two).  In other words, the file looks like:

```text
definition1 definition1 definition1 etc.
term1 term1 term1 etc.

definition2 definition2 definition2 etc.
term2 term2 term2 etc.
```

You can use this same file format for your cards if you like, or you can create your own.  Just don't get too fancy.  Remember, we're keeping it simple.

<!--
You could use CSV or YAML, but make sure that you have a good reason for picking the format that you do.  Pick a file format that solves for the data storage needs of the app, but no more.  At this point, do you really need anything more than plain text?

**Create your file for storing the cards.**   You can make the cards on any topic you like, just don't spend much time on the actual content.  Pick something simple (science, history, politics, exotic fruit, whatever) and give yourself a half-dozen cards to play around with.
-->

###Release 1 : Build it!
#### Core architecture

Now that you've got a general sketch for your app design and some sample data to work with, it's time to build out your app.

Think carefully about how each piece of the puzzle should fit together.  Build it out slowly and test as you go.  Skip the user interface (the part of your program that will receive and respond to user input) for now.  You can mock user input by creating having a method on one of your classes that takes a guess as an argument and performs the appropriate action.  Later you can hook this up to real, live user input.

Some questions to consider:

- How will you generate card objects from the source file?
- How will your classes interact?
- Where should the game logic live?  What about the file parsing?

#### Interface design

By this point, you should have all of the core components of your application built out.  In other words, *your code should be an accurate model of the ingredients needed for a real-life flashcard game*.  Are you missing anything?

Finally, it is time to implement the interactive part of the game: the piece that will actually let you play with it via your very-own custom interface.

Think about what kinds of inputs and outputs your interface will handle and write the code to match for them.

Some questions to consider:

- How should you check for whether the user's answer is correct?  Where should this logic live?
- What happens when a user starts the game?
- What happens when a user finishes the game?
- How will you handle incorrect answers?

Finish building out your app.  Make sure everything works peachy keen.

##Optimize Your Learning 

Consider your choices:
- Why did you organize your classes and logic in the way that you did?
- What have you learned about object-oriented thinking?
- How flexible is your code?  For example, how many changes would you have to make in how many different files to allow for users to see the first letter of the answer?  What if you wanted to allow case-insensitive answers? 


##Resources

* [software design patterns](http://en.wikipedia.org/wiki/Software_design_pattern)
* [Model-View-Controller](http://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller) 
*  [Jeff Atwood's post](http://www.codinghorror.com/blog/2008/05/understanding-model-view-controller.html) 

**SPOILER ALERT: These contain solutions to the Todo challenge - make sure you have solved it on your own first!**

* [Code for Tanner's ToDo app](https://gist.github.com/openspectrum/02239bf831cb7ad4b31f) 
* [Jesse's talk on refactoring the ToDo app](http://shereef.wistia.com/medias/c9cbc4fc79)  