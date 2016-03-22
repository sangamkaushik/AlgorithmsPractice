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
# # LRU Cache - Doesn't work, Need to implement a doubly linked list
class LRUCache
  def initialize prc, capacity=10
    @capacity = capacity
    @prc = prc
    @map = {}
    @store = LinkedList.new
  end

  def get key
    if @map[key]
      link = @map[key]
      update_link!(link)
      link.val
    else
      fetch_from_database(key)
    end
  end

  private

  def update_link! link
    link.prev.next = link.next
    link.next.prev = link.prev

    link.next = @store.head
    @store.head = link
    link.next.prev = link
  end

  def fetch_from_database link
    val = @prc.call(key)
    link = @store.insert_at_head(key, val)
    @map[key] = link

    eject! if @map.count > @capacity
    val
  end

  def eject!
    @map.delete(@tail.prev.next)
    @tail.prev.next = nil
  end
end

# # Heap - Binary Heap
class Heap
  def initialize(vals)
    @store = []
    vals.each { |val| insert(val) }
  end

  def insert(val)
    @store << val
    heapify_up!
    self
  end

  def pop_min
    return nil if length.zero?
    val = min
    swap!(0, length - 1)
    @store.pop
    heapify_down!
    val
  end

  def min
    @store.first
  end

  private

  def heapify_up!
    i = length - 1
    while i > 0
      current = @store[i]
      parent = @store[parent_idx(i)]
      if current < parent
        swap!(i, parent_idx(i))
        i = parent_idx(i)
      else
        break
      end
    end
  end

  def heapify_down!
    i = 0
    while i <= parent_idx(@store.length - 1)
      smallest_child = children_idx(i).min_by { |idx| @store[idx] }
      if @store[i] > @store[smallest_child]
        swap!(i, smallest_child)
        i = smallest_child
      else
        break
      end
    end
  end

  def parent_idx(i)
    i.zero? ? 0 : (i - 1) / 2
  end

  def children_idx(i)
    [(2 * i) + 1, (2 * i) + 2].select { |idx| idx < @store.length }
  end

  def swap!(i1, i2)
    @store[i1], @store[i2] = @store[i2], @store[i1]
  end

  def length
    @store.length
  end
end
# # Graph
