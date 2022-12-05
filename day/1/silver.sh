#!/bin/bash

paste -sd+ |                # -s read from stdin -d+ replace newline with +
sed -e 's/++/\n/g' |        # replace ++ with newline
bc |                        # Add up the lines
sort -nr |                  # sort numerically decending
head -1                     # first line is the max value