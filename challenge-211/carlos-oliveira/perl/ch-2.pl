use strict;
use warnings;
use v5.36;

use Test::More;
use Algorithm::Combinatorics qw(partitions);
use List::Util qw(sum uniqnum);
use builtin qw(true false);

sub can_be_split_with_same_average (@array) {
  my @same_averages =  grep { $_->@* == 1 }
  	map { [ uniqnum map sum($_->@*) / $_->@*, $_->@* ] }
  	partitions \@array, 2;
  return @same_averages > 1;
}

is can_be_split_with_same_average(1, 2, 3, 4, 5, 6, 7, 8), true;
is can_be_split_with_same_average(1, 3), false;

done_testing;
