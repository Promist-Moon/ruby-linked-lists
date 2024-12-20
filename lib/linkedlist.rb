class LinkedList 
  def initialize
    @head = nil
  end

  def append(value)
    new_node = Node.new
    new_node.set_value(value)

    if head.nil? 
      @head = new_node 
    else 
      current_node = @head
      current_node = current_node.next_node while current_node.next_node
      current_node.next_node = new_node
    end
  end

  def prepend(value)
    new_node = Node.new
    new_node.set_value(value)
    new_node.next_node = @head
    @head = new_node
  end

  def size
    size = 0
    current_node = @head
    while current_node
      size += 1
      current_node = current_node.next_node
    end
    size
  end

  def head
    @head
  end

  def tail
    return nil if @head == nil
    current_node = @head
    current_node = current_node.next_node while current_node.next_node
    current_node
  end

  def at(index)
    return nil if @head.nil? || index < 0
    current_node = @head
    while index > 0 && current_node
      current_node = current_node.next_node
      index -= 1
    end
    current_node
  end

  def pop
    if head.nil? 
      return nil
    else 
      current_node = @head
      current_node = current_node.next_node while current_node.next_node
      current_node.next_node = nil
    end
  end

  def contains?(value)
    return nil if @head.nil? 
    current_node = @head
    while current_node
      return true if current_node.value == value
      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    current_node = @head
    index = 0
    while current_node
      return index if current_node.value == value
      index += 1
      current_node = current_node.next_node
    end
    nil
  end

  def to_s
    current_node = @head
    while current_node
      print "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    puts "nil"
  end

  def insert_at(value, index)
    if index == 0
      prepend(value)
      return
    end 

    current_node = @head
    while index > 0 && current_node
      current_node = current_node.next_node
      index -= 1
    end
    
    new_node = Node.new(value)
    new_node.next_node = current_node.next_node
    current_node.next_node = new_node
  end

  def remove_at(index)
    return if @head.nil? 
    
    if index == 0
      @head = @head.next_node
      return
    end
  
    current_node = @head
    previous_node = nil
  
    while index > 0 && current_node
      previous_node = current_node
      current_node = current_node.next_node
      index -= 1
    end
  
    return unless current_node
    
    previous_node.next_node = current_node.next_node
  end
end