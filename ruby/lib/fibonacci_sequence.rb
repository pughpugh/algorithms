# fibonacci_sequence - Fibonacci Sequence Algorithms
#
# Author:: Hugh Gallagher [http://www.hughgallagher.co.uk]

module FibonacciSequence
    
    # Computes the Nth term of the Fibonacci sequence in a recursive fashion
    #   
    #   FibonacciSequence.recursive 10
    #
    def FibonacciSequence.recursive (index)
        return 0 if index == 0
        return 1 if index <= 2
        return FibonacciSequence.recursive( index - 1 ) +
               FibonacciSequence.recursive( index - 2 )
    end
    
    # Computes the Nth term of the Fibonacci sequence in a iterative fashion
    #   
    #   FibonacciSequence.iterative 10
    #
    def FibonacciSequence.iterative (index)
        return 0 if index == 0
        return 1 if index <= 2

        oldest, old, current = 0, 1, 1

        ( 3..index ).to_a.each do |i|
            oldest  = old
            old     = current
            current = old + oldest
        end

        return current
    end

    # Computes the Nth term of the Fibonacci sequence in a closed form fashion
    #   
    #   FibonacciSequence.closed_form 10
    #
    def FibonacciSequence.closed_form (index)
        s = Math.sqrt 5
        return ((((0.5 + 0.5 * s) ** index) - ((0.5 - 0.5 * s) ** index)) / s).to_i
    end

end
