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
      puts current
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

  def pop
    # #pop removes the last element from the list
    current = @head
    #loop until last node
    until current.next_node == @tail
      current = current.next_node
    end

    current.next_node = nil
    @tail = current
  end

  def contains?(value)
     # #contains?(value) returns true if the passed in value is in the list and otherwise returns false.

     current = @head
     until current.next_node.nil?
       current = current.next_node
       return true if current.value == value
     end
     return false
  end

  def find(value)
     # #find(value) returns the index of the node containing value, or nil if not found.
    current = @head
    index = 0
    until current.nil?
      return index if current.value == value

      current = current.next_node
      index += 1
    end
    return nil
  end
  
  def to_s
      # #to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console. 
      # The format should be: ( value ) -> ( value ) -> ( value ) -> nil
      current = @head
      string = ""
      until current.nil?
        string.concat("( #{current.to_s} ) -> ")
        current = current.next_node
      end
      string.concat(" nil")
      return string
  end

  def insert_at(value, index)
    new_node = Node.new(value)
    current = @head
    counter = 0
    if index == 0
      new_node.next_node = current
      @head = new_node
      return
    end
    until current.nil?
      if (index - 1) == counter
         new_node.next_node = current.next_node 
         current.next_node = new_node
         return
      else
        current = current.next_node
        counter +=1 
      end
    end
  end

  def remove_at(index)
    current = @head
    counter = 0
    previous = ""
    return @head = current.next_node if index == 0

    until current.nil?
        return previous.next_node = current.next_node if index == counter
        
        previous = current
        current = current.next_node
        counter +=1 
    end
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
puts "POP TESTING"
puts list.size
list.pop
puts list.size
puts list.contains?("test4")
puts list.find("test3")
puts list.to_s
list.insert_at("inserted", 3)
puts list.to_s
list.remove_at(1)
puts list.to_s


    #insert_at(value, index) that inserts a new node with the provided value at the given index.
    #remove_at(index) that removes the node at the given index.

    # Extra Credit Tip: When you insert or remove a node, consider how it will affect the existing nodes. Some of the nodes will need their #next_node link updated.
  
    #       puts "counter is #{counter}"
    # if (index -1) == counter
    #   next_node = next_node.next_node
    #   puts "in the loop"
    #   puts current
    #   puts current.next_node
    #   puts next_node
    #    current.next_node = next_node.next_node
    #    return
    # else
    #   current = current.next_node
    #   next_node = current.next_node
    #   counter +=1 
    #   puts "current is #{current}"
    #   puts "next_node is #{next_node}"
    #   puts "index is #{index}"
    #   puts "Next node next is #{next_node.next_node}"