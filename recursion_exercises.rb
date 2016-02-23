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
