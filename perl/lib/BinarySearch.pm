package BinarySearch;

use strict;
use warnings;

use base 'Exporter';
use POSIX;

our @EXPORT_OK = qw( recursive );

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

1;
