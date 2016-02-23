# Merge Sort
def merge_sort arr
  return arr if arr.length <= 1
  middle_idx = arr.length/2

  left = arr[0...middle_idx]
  right = arr[middle_idx..-1]

  merge(merge_sort(left), merge_sort(right))
end

def merge left, right
  resultant = []
  while (left.length > 0 && right.length > 0)
    if left[0] < right[0]
      resultant << left.shift
    else
      resultant << right.shift
    end
  end
  resultant + left + right
end

# Quick Sort
def quick_sort arr
  return arr if arr.length <= 1
  left, right = [], []
  pivot = arr.shift

  arr.each do |el|
    el < pivot ? left << el : right << el
  end

  quick_sort(left) + [pivot] + quick_sort(right)
end

# Bubble Sort
def bubble_sort arr
  sorted = false
  (0...arr.length).each do |_|
    sorted = true
    (0...arr.length-1).each do |idx2|
      if arr[idx2] > arr[idx2+1]
        arr[idx2],arr[idx2+1] = arr[idx2+1],arr[idx2]
        sorted = false
      end
    end
    return arr if sorted
  end
end

# Insertion Sort
def insertion_sort arr
  (0...arr.length-1).each do |idx|
    (idx+1...arr.length).each do |idx2|
      until arr[idx] < arr[idx2]
        arr[idx],arr[idx2] = arr[idx2], arr[idx]
      end
    end
  end
  arr
end
