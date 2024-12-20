class Node 
  def initialize
    @value = nil
    @next_node = nil
  end

  def set_value(value)
    @value = value
  end
  attr_accessor :value, :next_node
end