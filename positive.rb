# def positive_only1(arrary)
#   for n in arrary
#     if n < 0
#       puts false
#       return
#     end
#   end	
#   puts true
# end

# def positive_only2(array)
#   puts array.all? { |v| v > 0 }
# end

# positive_only1([1,3,4])
# positive_only1([1,3,-4,1])
# positive_only2([1,3,4])
# positive_only2([1,3,-4,1])

def array_map(a)
  b = []
  for n in a
    b << yield(n) 
  end
  b
end

p array_map([1,2,3]) { |v| v * 3}
