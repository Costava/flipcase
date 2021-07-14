#!/bin/bash

# Fail exit if something fails
set -o errexit
# Fail exit if a piped command fails
set -o pipefail
# Exit if variable not set
set -o nounset

# Names for our temporary files.
actual_file="TEMP_TEST_ACTUAL.txt"
expected_file="TEMP_TEST_EXPECTED.txt"

# Args: input text, expected output
# Assumes that the flipcase binary exists.
function check () {
    echo $1 | ./zig-out/bin/flipcase > $actual_file
    echo $2 > $expected_file
    diff $actual_file $expected_file
    rm $actual_file
    rm $expected_file
}

check "abcz" "ABCZ"
check "ABCZ" "abcz"
check "|%@&" "|%@&"
check "cat DOG bird" "CAT dog BIRD"

echo "ALL TESTS SUCCESSFUL"
