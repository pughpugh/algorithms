use strict;
use warnings;

use QuadraticSort qw( selection );
use Test::More;

my @array  = qw! 99 8 100 10 7 3 928 420 12131 2 64 !;
my @result = qw! 2 3 7 8 10 64 99 100 420 928 12131 !;

my @sorted = selection( @array );
is_deeply( \@sorted, \@result, 'can selection sort' );

done_testing();
