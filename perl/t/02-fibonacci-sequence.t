use strict;
use warnings;

use FibonacciSequence qw( recursive iterative closed_form );
use Test::More;

my @test_seq = qw( 0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584 4181 6765 );

for( my $i = 0; $i < scalar @test_seq; $i++ ){
    is( recursive( $i ),   $test_seq[$i] );
    is( iterative( $i ),   $test_seq[$i] );
    is( closed_form( $i ), $test_seq[$i] );
}

done_testing();
