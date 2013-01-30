require 'fibonacci_sequence'
require 'test/unit'

class TestFibonacci < Test::Unit::TestCase
    def test_fibonacci 
        test_seq = [ 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 
                     377, 610, 987, 1597, 2584, 4181, 6765 ]
        
        test_seq.each_with_index do |value, index|
            assert_equal( 
                test_seq[index], 
                FibonacciSequence.recursive( index ), 
                "Recursivly generating fibonacci(#{index})"
            )

            assert_equal( 
                test_seq[index], 
                FibonacciSequence.iterative( index ), 
                "Iterativly generating fibonacci(#{index})"
            )

            assert_equal( 
                test_seq[index], 
                FibonacciSequence.closed_form( index ), 
                "Closed form generating fibonacci(#{index})"
            )
        end
    end
end
