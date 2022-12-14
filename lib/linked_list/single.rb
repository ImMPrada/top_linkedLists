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
      return nil if !(0...@size).include?(index) || @size.zero?

      return @head if index.zero?

      node = @head
      index.times { node = node.next_node }
      node
    end

    def pop
      return nil if @size.zero?

      response = @tail.value

      if @size == 1
        @head = nil
        @tail = nil
      else
        @tail = at(@size - 2)
        @tail.next_node = nil
      end

      @size -= 1
      response
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

    def find(value)
      index = nil
      return index if @size.zero?

      (0...@size).each do |i|
        index = i if at(i).value == value
        break if index
      end

      index
    end

    def insert_at(value, index)
      return nil if !(0...@size).to_a.include?(index) || @size.zero?

      @size += 1

      return prepend(value) if index.zero?
      return append(value) if index == @size - 1

      previous_node = at(index - 1)
      next_node = at(index)
      new_node = Node.new(value, next_node)
      previous_node.next_node = new_node

      value
    end

    def to_s
      return 'nil' if @size.zero?

      node = @head
      steps = @size - 1
      response = "( #{node.value} ) ->"
      steps.times do
        node = node.next_node
        response += " ( #{node.value} ) ->"
      end

      response += ' nil'
    end

    private

    def first_add(new_node)
      @head = new_node
      @tail = new_node
      @head.next_node = @tail
      @tail.next_node = nil
    end
  end
end
