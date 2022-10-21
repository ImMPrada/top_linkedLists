require_relative 'node'

module LinkedList
  class Single
    attr_reader :head, :tail, :size

    def initialize
      @head = nil
      @tail = nil
      @size = 0
    end

    def append(value)
      new_node = Node.new(value)
      @size += 1

      if @head.nil?
        @head = new_node
        @tail = new_node
        @head.next_node = @tail
      else
        @tail.next_node = new_node
        @tail = new_node
      end
    end
  end
end
