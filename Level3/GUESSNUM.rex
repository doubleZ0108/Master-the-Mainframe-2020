/* REXX */
say "I'm thinking of a number between 1 and 10."
secret = RANDOM(1,10)
tries = 1

do while (guess \= secret)
    say "What is your guess?"
    pull guess

    if (DATATYPE(guess) == 'CHAR') then
    do
        say "That's not even a number, you silly gooes!"
        say "That's not it. Try again"
        tries = tries + 1
    end
    else
    do
        if (DATATYPE(guess,'W') <> 1)  then
        do
            say "A WHOLE number. Duh."
            say "That's not it. Try again"
            tries = tries + 1
        end
        else
        do
            if (guess > 10) then
            do
                say "What part of 1-10 did you not understand?"
            end

            if (guess < 0) then
            do
                say "What part of 1-10 did you not understand?"
            end

            if (guess \= secret) then
            do
                say "That's not it. Try again"
                tries = tries + 1
            end
        end
    end
end
say "You got it! And it only took you" tries "tries!"
exit

