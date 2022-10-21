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
        first_add(new_node)
      else
        @tail.next_node = new_node
        @tail = new_node
      end
    end

    def prepend(value)
      new_node = Node.new(value)
      @size += 1

      if @head.nil?
        first_add(new_node)
      else
        old_head = @head
        @head = new_node
        @head.next_node = old_head
      end
    end

    private

    def first_add(new_node)
      @head = new_node
      @tail = new_node
      @head.next_node = @tail
    end
  end
end
