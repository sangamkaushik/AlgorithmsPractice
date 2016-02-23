require 'byebug'
#Monkey Patching methods to array class
class Array
  # Transpose of any rectangular matrix in array form
  # Time complexity m*n (row length * column length)
  def transpose
    resultant = []
    self[0].length.times do |idx2|
      temp_row = []
      self.length.times do |idx|
        temp_row << self[idx][idx2]
      end
      resultant << temp_row
    end
    resultant
  end

  # Do two numbers in an array sum up to 'sum'
  # Time complexity O(n)
  def two_sum? sum
    dict = Hash.new(false)
    self.each do |el|
      return [sum-el, el] if dict[el]
      dict[sum-el] = true
    end
    false
  end

  # List all pairs that sum up to 'sum'
  # Time complexity: O(n)
  def two_sum_pairs sum
    dict = Hash.new([false])
    resultant = []
    self.each_with_index do |el, idx|
      resultant << [dict[el][1],idx] if dict[el][0]
      dict[sum-el] = [true, idx]
    end
    resultant
  end

  # Alter array to contain unique values. (Delete Duplicate values)
  def my_unique
    dict = Hash.new(false)
    self.each_with_index do |el, idx|
      self[idx] = nil if dict[el]
      dict[el] = true
    end
    self.compact!
  end

  def median
    self.sort!
    self.length % 2 == 0 ? (self[length/2-1] + self[length/2])/2.0 : self[length/2]
    #length/2 rounds to lower value, so it accounts for idx count starting at 0
  end

  def slice start_idx, num_el=nil
    num_el ||= self.length - start_idx
    return nil if start_idx < 0 || start_idx > self.length - 1 || num_el < 0

    resultant = []
    (start_idx..start_idx+num_el-1).each do |idx|
      resultant << self[idx]
    end
    resultant
  end

  def my_flatten
    return self if self.length == 1 && !self[0].is_a?(Array)
    resultant = []
    self.each do |el|
      unless el.is_a?(Array)
        resultant << el
      else
        resultant += el.my_flatten
      end
    end
    resultant
  end

  def my_flatten!
    return nil if self.length == 1 && !self[0].is_a?(Array)
    flatten = false
    idx = 0
    a = self.length
    self.each_with_index do |el,idx|
      if el.is_a?(Array)
        flatten = true
        flattened_el = el.my_flatten
        self.delete_at(idx)
        flattened_el.reverse!
        flattened_el.each {|el2| self.insert(idx, el2)}
      end
    end
    return nil unless flatten
    self
  end

  def my_zip arr
    return nil if self.length != arr.length
    resultant = []

    self.each_with_index do |el, idx|
      resultant << [el, arr[idx]]
    end
    resultant
  end

  def my_reverse!
    return self if length <= 1
    current_idx = 0
    self.length.times do |_|
      self.insert(current_idx, self.pop)
      current_idx += 1
    end
    self
  end
end
