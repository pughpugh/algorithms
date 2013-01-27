use strict;
use warnings;

use BinarySearch qw( recursive iterative );
use Test::More;

my @numeric_list_1 = qw! 1 2 3 4 5 6 7 8 9 10 !;
my @numeric_list_2 = qw! -1001 -232 -3 0 4 78 89 99 10000 !;

my @test_data = (
    { list => \@numeric_list_1, search => 5,        result => 4     },
    { list => \@numeric_list_1, search => 10,       result => 9     },
    { list => \@numeric_list_1, search => 1,        result => 0     },
    { list => \@numeric_list_1, search => 11,       result => undef },
    { list => \@numeric_list_1, search => -1,       result => undef },

    { list => \@numeric_list_2, search => 78,       result => 5     },
    { list => \@numeric_list_2, search => -1001,    result => 0     },
    { list => \@numeric_list_2, search => 52,       result => undef },
);

foreach my $test ( @test_data ){
    is( recursive( $test->{list}, $test->{search} ), $test->{result} );
    is( iterative( $test->{list}, $test->{search} ), $test->{result} );
}

done_testing();
