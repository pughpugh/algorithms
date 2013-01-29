# binary_search - Binary Search Algorithms
#
# Author:: Hugh Gallagher [http://www.hughgallagher.co.uk]

module BinarySearch
    
    # Finds the specified needle in array haystack in a recursive fashion
    #   
    #   numbers = [ -10 -2 0 3 6 88 900 1001 ]
    #   recursive numbers, 88
    #
    def BinarySearch.recursive (array, value, min = 0, max = array.length - 1)
        return if max < min;
    
        midindex = ( ( max + min ).to_f / 2 ).floor
        midvalue = array[midindex]
    
        return if midvalue == nil
    
        if midvalue > value
            return recursive array, value, min, midindex - 1
        elsif midvalue < value
            return recursive array, value, midindex + 1, max
        else
            return midindex
        end
    
        return
    end
    
    # Finds the specified needle in array haystack in a iterative fashion
    #   
    #   numbers = [ -10 -2 0 3 6 88 900 1001 ]
    #   iterative numbers, 88
    #
    def BinarySearch.iterative (array, value)
        min = 0
        max = array.length - 1
    
        while max >= min do
            midindex = ( ( max + min ).to_f / 2 ).floor
            midvalue = array[midindex]
    
            return if midvalue == nil
    
            if midvalue > value
                max = midindex - 1
            elsif midvalue < value
                min = midindex + 1
            else
                return midindex
            end
        end
    
        return
    end

end
