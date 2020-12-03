#!/bin/sh
# Why is this a .md file when its Bash?: to avoid GitHub's language detection 
#
# To run: bash scorekeeper.md
# To run real mean: bash scorekeeper.md && git commit . -m "Score keeping." && git push
#
# What I do: scan the directories and append a scores table & breakdown to the bottom
# Stuff to be aware of: 
# - I overwrite the existing README.md
# - If you want a blankline in the README, make sure you put a space on it
# - If you want a backslash in the README, don't let it be the last character of the line
# - I don't score newlines & trim leading & trailing whitespace from lines
#   because of this sometimes a score may be 1 or 2 out from what your text editor says
#   I am correct.
# 
# To Test: uncomment the keeper checks at the end & compare with Keeper/scorekeeper.test


# use the unique bottom of the scores title to find where to whack em
scores_indicator="@@        |____/ \___\___/|_|  \___||___/    @@ ";
# output string, gotta start somewhere
output="";

# chomp thru the readme to find the score section
IFS=$'\n' lines=($(<README.md));
for line in ${lines[@]}; do
  output="${output}\n${line}";
  if [ "$line" == "$scores_indicator" ]; then break; fi; 
done;



# tally up the scores!!
trim() {
    local trimmed="$1";
    # Strip leading spaces.
    while [[ $trimmed == ' '* ]]; do
       trimmed="${trimmed## }";
    done;
    # Strip trailing spaces.
    while [[ $trimmed == *' ' ]]; do
        trimmed="${trimmed%% }";
    done;
    echo "$trimmed"
}

chr() {
  [ "$1" -lt 256 ] || return 1
  printf "\\$(printf '%03o' "$1")"
}

ord() {
  LC_CTYPE=C printf '%d' "'$1"
}

tiny() {
    sed 'y/0123456789/⁰¹²³⁴⁵⁶⁷⁸⁹/' <<< "$1"
}

score_file() {
  score=0;
  IFS=$'\n' file_lines=($(< $1));
  for file_line in ${file_lines[@]}; do
    if [[ $file_line = '//'* ]]; then continue; 
    elif  [[ $file_line = '#'* ]]; then continue; 
    fi;
    # Strip leading space.
    file_line="$(trim $file_line)";
    line_score=${#file_line};
    score=$[score+line_score];
  done;
  echo $score;
}

recurse() {
 for i in "$1"/*;do

    player=$(echo "$i" | cut -d "/" -f2);
    player_index=$(ord $player);

    # skip the Keeper, comment for debug
    if [ "$player" == "Keeper" ]; then continue; fi;

    # its a dir
    if [ -d "$i" ];then
        recurse "$i";

    # its a file
    elif [ -f "$i" ]; then
        if [ "$1" != "." ]; then # its not a root file

          filename="$(basename "$i")"
          if [[ $i == *.txt ]]; then continue; fi; # skip txt
          if [[ $i == *.md ]]; then continue; fi; # skip md
          if [[ $filename =~ (.*)?\.(.*) ]]; then :; else continue; fi; # skip extensionless files

          local score=$(score_file $i);
          players[$player_index]=$player;
          player_totals[$player_index]=$[player_totals[$player_index] + score];
          tiny_running_total=$(tiny ${player_totals[$player_index]});
          output="${output}\n! ${i} scores [${score}] ⁽${tiny_running_total}⁾";
        fi;
    fi;
 done;
}

# do the magic
output="${output}\n\n\n@@ Breakdown: @@";
recurse .
output="${output}\n+ note: this ignores txt, md and extensionless files!";


# loop final scores
output="${output}\n\n\n@@ Totals: @@";
for i in ${!players[@]};do

  # skip the Keeper, comment for debug
  if [ "${players[$i]}" == "Keeper" ]; then continue; fi;

  symbol="+";   
  for opp in ${!players[@]};do
    # skip the Keeper, comment for debug
    if [ "${players[$opp]}" == "Keeper" ]; then continue; fi;
    if (("${player_totals[$opp]}" < "${player_totals[$i]}")); then symbol="!"; fi;
  done;

  output="${output}\n${symbol} ${players[$i]} scores a total [${player_totals[$i]}]";
done;

# last things!
dt=$(date '+%d/%m/%Y %H:%M:%S');
output="${output}\n\n\nUpdated ${dt} Local time\n";
printf $output > README.md;
printf $output;