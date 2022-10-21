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

    def at(index)
      return nil if index > @size - 1 || @size.zero?

      return @head if index.zero?

      node = @head
      index.times { node = node.next_node }
      node
    end

    def pop
      return nil if @size.zero?

      if @size == 1
        @head = nil
        @tail = nil
      else
        @tail = at(@size - 2)
        @tail.next_node = nil
      end
    end

    def contains?(value)
      is_there = false
      return is_there if @size.zero?

      (0...@size).each do |i|
        is_there = at(i).value == value
        break if is_there
      end

      is_there
    end

    private

    def first_add(new_node)
      @head = new_node
      @tail = new_node
      @head.next_node = @tail
    end
  end
end
