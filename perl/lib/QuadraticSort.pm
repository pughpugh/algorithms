=head1 NAME

QuadraticSort - Quadratic Sort Algorithms

=head1 SYNOPSIS

    use QuadraticSort qw( selection );

=cut

package QuadraticSort;

use strict;
use warnings;

use base 'Exporter';

our @EXPORT_OK = qw( selection );

=head1 SUBROUTINES

=head2 C<selection( ARRAYREF )>

Takes an array and returns it sorted in a selection fashion.

=cut

sub selection {
    my @array = @_;
    my ( $i, $j );
    
    for( $i = 0; $i < scalar @array; $i++) {
        my $min_index = $i;
        my $min_value = $array[$min_index];

        for( $j = $i + 1; $j < scalar @array; $j++ ) {
            ( $min_index, $min_value ) = ( $j, $array[$j] ) if $array[$j] < $min_value;
        }

        @array[ $min_index, $i ] = @array[ $i, $min_index ] if $i != $j;
    }

    return @array;
}

1;
