#!/bin/bash

# Column 1 Them : A for Rock, B for Paper, and C for Scissors.
# Column 2 Us   : X means you need to lose, Y means you need to end the round in a draw, and Z means you need to win.

# Score : Our Play - 1 for Rock, 2 for Paper, and 3 for Scissors
#         Outcome  - 0 if you lost, 3 if the round was a draw, and 6 if you won

# A X =(C)= 3+0 == 3
# A Y =(A)= 1+3 == 4
# A Z =(B)= 2+6 == 8
# B X =(A)= 1+0 == 1
# B Y =(B)= 2+3 == 5
# B Z =(C)= 3+6 == 9
# C X =(B)= 2+0 == 2
# C Y =(C)= 3+3 == 6
# C Z =(A)= 1+6 == 7

scores=("B X" "C X" "A X" "A Y" "B Y" "C Y" "C Z" "A Z" "B Z")  # Only a slight reording needed

score=0

while IFS='$\n' read -r round; do
    for i in "${!scores[@]}"; do
        if [[ "${scores[$i]}" = "${round}" ]];
        then
            score=$((score+i+1))    # The round's index +1 is the score when ordered by score asc
            break
        fi
    done
done < <(sed -e '$a\')  # sed here accounts for missing newlines at end of files
                        # Process Substitution is used instead of pipe because we need the score variables modifications.
echo ${score}