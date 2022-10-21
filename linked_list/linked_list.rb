require_relative 'node'

module LinkedList
  class Single
    attr_reader :head, :tail, :size

    def initialize
      @head = nil
      @tail = nil
      @size = 0
    end
  end
end
