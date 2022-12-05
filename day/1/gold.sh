#!/bin/bash

paste -sd+ |                # -s read from stdin -d+ replace newline with +
sed -e 's/++/\n/g' |        # replace ++ with newline
bc |                        # Add up the values
sort -nr |                  # sort numerically decending
head -3  |                  # top 3
paste -sd+ |                # -s read from stdin -d+ replace newline with +
bc                          # add up the values