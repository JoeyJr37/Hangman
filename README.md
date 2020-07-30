# Hangman

This is a project completed for The Odin Project
Assignment:

You will be building a simple command line Hangman game where one player plays against the computer, but a bit more advanced. If you’re unfamiliar with how Hangman works, see Wikipedia.

Step 1: Download the 5desk.txt dictionary file from http://scrapmaker.com/.

When a new game is started, your script should load in the dictionary and randomly select a word between 5 and 12 characters long for the secret word.

You don’t need to draw an actual stick figure (though you can if you want to!), but do display some sort of count so the player knows how many more incorrect guesses he/she has before the game ends. 

You should also display which correct letters have already been chosen (and their position in the word, e.g. _ r o g r a _ _ i n g) and which incorrect letters have already been chosen.

Every turn, allow the player to make a guess of a letter. It should be case insensitive. Update the display to reflect whether the letter was correct or incorrect. If out of guesses, the player should lose.

Now implement the functionality where, at the start of any turn, instead of making a guess the player should also have the option to save the game. Remember what you learned about serializing objects… you can serialize your game class too!

When the program first loads, add in an option that allows you to open one of your saved games, which should jump you exactly back to where you were when you saved. Play on!

Problem Solving:
1. Plan: Does the program have a user interface? 
    What will it look lke? What functionality will the interface have?

    -- This will be a command line application, but the user should be able to see: 
        1) letters guessed
            a) correct letters should appear in their appropriate place in the word
            b) incorrect letters should be displayed also 
        2) turns remainining, 
        3) an option to save the game should be present

    What inputs will your program have? Will the user enter data or will you get input from somewhere else?

    -- Inputs will come both from a file saved in the 'Hangman' root directory as well as from the user

    -- Desired outputs:
        1) a randomly selected word from the dictionary file
        2) after receiving each user guess, the program should determine whether or not the letter is included in the randomly selected word
        3) the program should display the letter either in its correct position in the word or under the "incorrect" category
        4) the player's turn count should decrease by 1
        5) the program should determine if the word has been guessed or not
        6) the program should present the option to save the progress of the game
        7) the program should be able to load a saved game

    Give your inputs, what are the steps necessary to return the desired output?

