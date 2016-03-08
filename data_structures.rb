# Queue
class Queue
  def initialize
    @queue = []
    @start_idx = 0
    @end_idx = 0
  end

  def enqueue n
    @queue << n
  end

  def dequeue
    @queue.shift
  end

  def length
    @queue.length
  end

  def to_s
    @queue.to_s
  end
end

# Stack
class Stack
  def initialize
    @stack = []
  end

  def push n
    @stack << n
  end

  def pop
    @stack.pop
  end

  def length
    @stack.length
  end

  def to_s
    @stack.to_s
  end
end
# # Tree
#
# # Binary Tree
#
# Linked List
class ListNode
  attr_accessor :value, :next
  def initialize(val)
    @value = val
    @next = nil
  end
end

# Doubly Linked List
class ListNodeDouble
  attr_accessor :value, :next, :prev
  def initialize(val)
    @value = val
    @next = nil
    @prev = nil
  end
end
# # Hash Map
#
# # LRU Cache
#
# # Heap
#
# # Graph
