class Array

  def implant(startpoint, &method) # takes an argument and a block
    result = startpoint #startpoint is first argument to the block
    self.each do |element| #iterate over every element in array
      result = method.call(result, element) # block executed once for every element in the array and result updated each time
      end
      result # delivers the final value, array, whatever
    end
  end




# class Array

#   def implant(startpoint, &method) # takes an argument and a block
#     result = startpoint #startpoint is yeilded as the first argument to the method
#     self.each do |el| #iterate over every element in array
#       result = yield(result, el) # method executed once for every element in the array
#     end
#     result
#    end
# end

# The argument passed to inject will be yielded as the first argument to the block, the first time it's executed. The second argument yielded to the block will be the first element of the object that we called inject on.

# So, the block will be executed 4 times, once for every element of our array ([1,2,3,4]). The first time the block executes the result argument will have a value of 0 (the value we passed as an argument to inject) and the element argument will have a value of 1 (the first element in our array).

# You can do anything you want within the block, but the return value of the block is very important. The return value of the block will be yielded as the result argument the next time the block is executed.

# In our example we add the result, 0, to the element, 1. Therefore, the return value of the block will be 0 + 1, or 1. This will result in 1 being yielded as the result argument the second time the block is executed.

#   end

# end 

# # def map_new(&method)
# #     output = []
# #     self.each do |el|
# #       output << method.call(el)
# #     end
# #     output
# #   end

#  # numbers = [1,2,2]
#   # puts numbers.inject(0) {|result, element| result + element}
#   # puts numbers.inject(0) {|result, element| puts "I am #{result}, I am #{element}"}


#   # # def count_of_words(str)
#   # #   str.split(' ').inject(Hash.new(0)) do |count_hash, word|
#   # #     count_hash[word] += 1
#   # #     count_hash
#   # #   end
#   # # end

#   # # count_of_words('ruby is awesome and ruby is great')

#   # # [1, 2, 3, 4, 5, 6].inject([]) do |result, elm|
#   # #   result << elm * 2 if elm % 2 == 0
#   # #   result
#   # # end

#   # ["alpha", "bravo", "charlie", "bark", "almond"].inject({}) do |result, elm|
#   #   result[elm[0].to_sym] = []
#   #   result[elm[0].to_sym] << elm
#   #   result
#   # end

#   # here we the argument 0 is the result, and 1 is the element
#   # then 1 is the result, and the element is 2 so 1+2 = 3 
#   # then 3 is the result and the element is 2 so 3 + 2 = 5
