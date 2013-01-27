# binary_search - Binary Search Algorithms
#
# Author:: Hugh Gallagher [http://www.hughgallagher.co.uk]

# Finds the specified needle in array haystack
#   
#   numbers = [ -10 -2 0 3 6 88 900 1001 ]
#   recursive numbers, 88
#
def recursive (array, value, min = 0, max = array.length)
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
end
