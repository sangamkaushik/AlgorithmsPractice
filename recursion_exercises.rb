require 'byebug'
# Binary Search
def binary_search arr, target
  return nil if arr.length <= 1 && arr[0] != target
  middle_idx = arr.length/2
  return middle_idx if arr[middle_idx] == target

  if target > arr[middle_idx]
    right = arr[middle_idx+1..-1]
    right_target = binary_search(right, target)
    right_target += middle_idx + 1 if right_target
  else
    left = arr[0...middle_idx]
    left_target = binary_search(left, target)
  end

  target_idx = right_target || left_target
  return target_idx if target_idx
  nil
end

# Fibonacci - return nth fib
def fibonacci n
  return nil if n < 1
  return 0 if n == 1
  return 1 if n == 2

  x = fibonacci(n-1)
  y = fibonacci(n-2)

  return x+y
end

# Fibonacci - return an array of n fibs
def fibs_list n
  return nil if n < 1
  return [0] if n==1
  return [0,1] if n==2

  prev_array = fibs_list(n-1)
  current_fib = prev_array[-1] + prev_array[-2]
  return (prev_array + [current_fib])
end

# Factorial
def factorial n
  return nil if n<0
  return 1 if n == 0
  return 1 if n == 1
  n * factorial(n-1)
end

# Subsets
def subsets arr
  return [[]] if arr.length == 0
  return [[],[arr[0]]] if arr.length == 1
  last_el = arr.dup.pop
  prev_subsets = subsets(arr[0...-1])

  new_sets = prev_subsets.map do |el|
    el + [last_el]
  end

  prev_subsets + new_sets
end

# Permutations
def permutations str
  return [str] if str.length == 1
  first_char = str[0]
  prev_perms = permutations(str[1..-1])
  resultant = []
  prev_perms.each do |perm|
    (0..perm.length).each do |idx|
      resultant << perm.dup.insert(idx,first_char)
    end
  end
  resultant
end

# Arithmetic Permutations
# [1,2] => 2+1, 2-1, 2*1, 2/1, 1-2, 1/2

# [1,2,3] =>  2+1+3, 2-1+3, 2*1+3, 2/1+3,
#             2+1-3, 2-1-3, 2*1-3, 2/1-3,
#             2+1*3, 2-1*3, 2*1*3, 2/1*3,
#             2+1/3, 2-1/3, 2*1/3, 2/1/3

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

# def arithmetic_permutations num
#   return [""] if num <= 1
#   return ['+', '-', '*', '/'] if num == 2
#   prev_perms = arithmetic_permutations(num-1)
#   resultant = []
#   prev_perms.each do |perm|
#     resultant << (perm + '+')
#     resultant << (perm + '-')
#     resultant << (perm + '*')
#     resultant << (perm + '/')
#   end
#   resultant
# end

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

def triple_byte num,target
  subsets = num_subsets(num.to_s) #Covert the number to string, then send it to num_subsets to get all possible subsets.
  nums_array = subsets.map{|x| x.split(" ")}  #Turn it into better format. Take the spaces out to form numbers.
  matches = []
  nums_array.map! do |nums|
    permutations = arithmetic_permutations(nums) #Insert arithmetic operators at each space to find all permutations possible.
    permutations.each do |expression|
      puts expression + " = #{target}" if eval(expression) == target
    end
  end
end


# subsets
# [] => [[]]
# [1] => [[],[1]]
# [1,2] => [[],[1], [2], [1,2]]
# def num_subsets nums
#   return [nums] if nums.length <= 1
#   last_el = nums[-1]
#   prev_subsets = num_subsets(nums[0...-1])
#   resultant = []
#   new_sets = prev_subsets.map do |subset|
#     resultant << subset
#     resultant << subset + [last_el]
#   end
#
#   return resultant
# end
