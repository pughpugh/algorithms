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

our @EXPORT_OK = qw( recursive iterative );

=head1 SUBROUTINES

=head2 C<recursive( ARRAYREF, NEEDLE )>

Finds the specified needle in arrayref haystack in a recursive fashion.

=cut

sub recursive {
    my ( $array, $value, $min, $max ) = @_;

    $min //= 0;
    $max //= @$array - 1;

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

    return;
}

=head2 C<iterative( ARRAYREF, NEEDLE )>

Finds the specified needle in arrayref haystack in an iterative fashion.

=cut

sub iterative {
    my ( $array, $value ) = @_;
    my $min = 0;
    my $max = @$array - 1;

    while ( $max >= $min ){
        my $midindex = floor( ( $max + $min ) / 2 );
        my $midvalue = $array->[$midindex];

        return if ! defined $midvalue; # Index out of range

        if( $midvalue > $value ){
            $max = $midindex - 1;
        }
        elsif( $midvalue < $value ){
            $min = $midindex + 1;
        }
        else{
            return $midindex;
        }
    }

    return;
}

=head1 AUTHOR

Hugh Gallagher - L<http://hughgallagher.co.uk>

=cut

1;
