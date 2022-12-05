#!/bin/bash

# Column 1 Them : A for Rock, B for Paper, and C for Scissors.
# Column 2 Us   : X for Rock, Y for Paper, and Z for Scissors.

# Score : Column 2 - 1 for Rock, 2 for Paper, and 3 for Scissors
#         Outcome  - 0 if you lost, 3 if the round was a draw, and 6 if you won
# A X == 1+3 == 4
# A Y == 2+6 == 8
# A Z == 3+0 == 3
# B X == 1+0 == 1
# B Y == 2+3 == 5
# B Z == 3+6 == 9
# C X == 1+6 == 7
# C Y == 2+0 == 2
# C Z == 3+3 == 6
# Do you see it?

scores=("B X" "C Y" "A Z" "A X" "B Y" "C Z" "C X" "A Y" "B Z")

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
