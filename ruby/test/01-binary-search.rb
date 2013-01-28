require 'binary_search'
require 'test/unit'

class TestRecursive < Test::Unit::TestCase
    def test_simple 
        numeric_list_1 = (1..10).to_a
        numeric_list_2 = [ -1001, -232, -3, 0, 4, 78, 89, 99, 10000 ]

        test_data = [
            { :list => numeric_list_1, :search => 5,     :result => 4   },  
            { :list => numeric_list_1, :search => 10,    :result => 9   },  
            { :list => numeric_list_1, :search => 1,     :result => 0   },  
            { :list => numeric_list_1, :search => 11,    :result => nil },
            { :list => numeric_list_1, :search => -1,    :result => nil },

            { :list => numeric_list_2, :search => 78,    :result => 5   },  
            { :list => numeric_list_2, :search => -1001, :result => 0   },  
            { :list => numeric_list_2, :search => 52,    :result => nil },
        ]

        for test in test_data
            assert_equal( 
                test[:result], 
                BinarySearch.recursive( test[:list], test[:search] ), 
                "recursivly searching for #{test[:search]} in " +
                    test[:list].to_s + " Expecting index #{test[:result]}"
            )

            assert_equal( 
                test[:result], 
                BinarySearch.iterative( test[:list], test[:search] ), 
                "iterativly searching for #{test[:search]} in " +
                    test[:list].to_s + " Expecting index #{test[:result]}"
            )
        end
    end
end
