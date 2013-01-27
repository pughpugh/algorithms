=head1 NAME

BinarySearch - Binary Search Algorithms

=head1 SYNOPSIS

    use BinarySearch qw( recursive );

    my @numbers = qw( -10 -2 0 3 6 88 900 1001 );
    my $index = recursive \@numbers, 88; 
    
=cut

package BinarySearch;

use strict;
use warnings;

use base 'Exporter';
use POSIX;

our @EXPORT_OK = qw( recursive );

=head1 SUBROUTINES

=head2 C<recursive( ARRAYREF, NEEDLE )>

Finds the specified needle in arrayfre haystack

=cut

sub recursive {
    my ( $array, $value, $min, $max ) = @_;

    $min //= 0;
    $max //= @$array;

    return if $max < $min;

    my $midindex = floor( ( $max + $min ) / 2 );
    my $midvalue = $array->[$midindex];

    return if ! defined $midvalue; # Index out of range

    if ( $midvalue > $value ) { # Lower bound
        return recursive( $array, $value, $min, $midindex - 1 );
    }
    elsif ( $midvalue < $value ) { # Upper bound
        return recursive( $array, $value, $midindex + 1, $max );
    }
    else { # Match
        return $midindex;
    }
}

=head1 AUTHOR

Hugh Gallagher - L<http://hughgallagher.co.uk>

=cut

1;
