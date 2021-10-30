class LinkedList
  attr_reader :head, :tail

  #array of objects
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    # append(value) adds a new node containing value to the end of the list
    # create a new node 
    this_node = Node.new(value)
    @tail = this_node
    if @head.nil?
      @head = this_node
      return
    end

    current = @head
    #loop until last node
    until current.next_node.nil?
      current = current.next_node
    end

    #point last node to our new node
    current.next_node = this_node
    p current.next_node
  end

  def prepend(value)
    # prepend(value) adds a new node containing value to the start of the list
    this_node = Node.new(value, @head)
    @head = this_node
  end

  def size
    return 0 if @head.nil?

    counter = 1
    current = @head
    until current.next_node.nil?
      current = current.next_node
      counter += 1
    end
    return counter
  end

  def at_index(index)
    #at(index) returns the node at the given index
    counter = 0
    current = @head
    until current.next_node.nil?
      return current if index == counter

      current = current.next_node
      counter +=1 
    end
    return "ERROR - Invalid Index"
  end

  
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

  def to_s
    self.value
  end
end

puts "Working"



list = LinkedList.new

list.append("test1")
list.append("test2")
list.append("test3")
list.append("test4")
list.prepend("test0")
puts list.size
puts list.head
puts list.tail
puts list.at_index(0)
puts list.at_index(2)
puts list.at_index(7)




    
    # #pop removes the last element from the list
    # #contains?(value) returns true if the passed in value is in the list and otherwise returns false.
    # #find(value) returns the index of the node containing value, or nil if not found.
    # #to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil
