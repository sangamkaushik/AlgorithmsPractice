# My approach is to find all the permutations of the input digits without changing the order or length.
# I accomplish that in the num_subsets method. The method returns numbers with spaces in between.
# In the arithmetic_permutations method, I take the numbers from num_subsets and return all permutations of arithmetic operators
# in between them.
# Finally, I print the expression using puts, if the expression evaluates to target.
# I am hesitant to solve the problem in this manner. I am not sure how optimal this solution may be, but due to time constraints, I went ahead with my gut instincts.

def f num,target
  #Convert the number to string, then send it to num_subsets to get all possible subsets.
  subsets = num_subsets(num)
  #Turn it into format needed by permutations method. (Take the spaces out to form numbers.)
  nums_array = subsets.map{|x| x.split(" ")}
  nums_array.map! do |nums|
    permutations = arithmetic_permutations(nums) #Insert arithmetic operators at each space to find all permutations possible.
    permutations.each do |expression|
      if matches_target?(expression, target)
        puts expression + " = #{target}"
      end
    end
  end
end

# nums is an array of numbers in string format
def arithmetic_permutations nums
  return nums if nums.length <= 1
  last_char = nums[-1]
  prev_perms = arithmetic_permutations(nums[0...-1])
  resultant = []
  prev_perms.each do |perm|
    resultant << (perm + ' + ' + last_char)
    resultant << (perm + ' - ' + last_char)
    resultant << (perm + ' * ' + last_char)
    resultant << (perm + ' / ' + last_char)
  end
  resultant
end

#num_subsets finds all subsets of the number and returns an array of them.
#num is in string format.
#It essentially inserts spaces at different spots of the string to find all possible subsets.
def num_subsets num
  return [num] if num.length <= 1
  last_char = num[-1]
  prev_subsets = num_subsets(num[0...-1])
  resultant = []

  prev_subsets.each do |subset|
    resultant << subset + last_char
    resultant << subset + " " + last_char
  end
  resultant
end

#This method evaluates the string and checks whether it's equivalent to the target value.
def matches_target? exp, target
  exp2 = exp.dup
  exp = exp.split(" ").map.with_index{ |el, idx| idx.even? ? el.to_i : el.to_sym}
  accumulator = exp.shift;
  (exp.length/2).times do |_|
    accumulator = accumulator.send(exp.shift, exp.shift)
  end
  accumulator == target
end
