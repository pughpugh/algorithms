=head1 NAME

FibonacciSequence - Fibonacci Sequence Algorithms

=head1 SYNOPSIS

    use FibonacciSequence qw( recursive iterative closed_form );

    my $number = recursive $index;
    my $number = iterative $index;
    my $number = closed_form $index;
    
=cut

package FibonacciSequence;

use strict;
use warnings;

use base 'Exporter';

our @EXPORT_OK = qw( recursive iterative closed_form );

=head1 SUBROUTINES

=head2 C<recursive( INDEX )>

Computes the Nth term of the Fibonacci sequence in a recursive fashion

=cut

sub recursive {
    my $index = shift;
    return 0 if $index == 0;
    return 1 if $index == 1;
    return recursive( $index - 1 ) + recursive( $index - 2 ); 
}

=head2 C<iterative( INDEX )>

Computes the Nth term of the Fibonacci sequence in a iterative fashion

=cut

sub iterative {
    my $index = shift;
    my ( $older, $old, $current ) = ( 0, 1, 1 );

    return 0 if $index == 0;
    return 1 if $index <= 2;

    for( my $i = 3; $i <= $index; $i++ ){
        $older   = $old;
        $old     = $current;
        $current = $old + $older;
    }

    return $current;
}

=head2 C<closed_form( INDEX )>

Computes the Nth term of the Fibonacci sequence in a closed form fashion

=cut

sub closed_form {
    my $index = shift;
    my $s     = sqrt(5);
    return (((0.5 + 0.5*$s) ** $index) - ((0.5 - 0.5*$s) ** $index)) / $s;
}

=head1 AUTHOR

Hugh Gallagher - L<http://hughgallagher.co.uk>

=cut

1;
