require './spec/spec_helper'

RSpec.describe LinkedList::Single do
  let(:list) { described_class.new }

  describe 'when initialized' do
    it 'has a nil head' do
      expect(list.head).to be_nil
    end

    it 'has a nil tail' do
      expect(list.tail).to be_nil
    end

    it 'returns a Single object' do
      expect(list).to be_a(described_class)
    end
  end

  describe '#append' do
    describe 'when the list is empty' do
      before { list.append(1) }

      it 'adds a node to the list' do
        expect(list.head.value).to eq(1)
      end

      it 'sets the head and tail to the same node' do
        expect(list.head).to eq(list.tail)
      end

      it 'increments the size' do
        expect(list.size).to eq(1)
      end

      it 'sets tail next_node to nil' do
        expect(list.tail.next_node).to be_nil
      end
    end

    describe 'when the list is not empty' do
      before do
        list.append(1)
        list.append(2)
      end

      it 'sets the tail to the new node' do
        expect(list.tail.value).to eq(2)
      end

      it 'sets the head and tail to diferent nodes' do
        expect(list.head).not_to eq(list.tail)
      end

      it 'increments the size' do
        expect(list.size).to eq(2)
      end

      it 'sets tail next_node to nil' do
        expect(list.tail.next_node).to be_nil
      end
    end
  end

  describe '#prepend' do
    describe 'when the list is empty' do
      before { list.prepend(1) }

      it 'adds a node to the list' do
        expect(list.head.value).to eq(1)
      end

      it 'sets the head and tail to the same node' do
        expect(list.head).to eq(list.tail)
      end

      it 'increments the size' do
        expect(list.size).to eq(1)
      end

      it 'sets tail next_node to nil' do
        expect(list.tail.next_node).to be_nil
      end
    end

    describe 'when the list is not empty' do
      before do
        list.append(1)
        list.prepend(2)
      end

      it 'sets the head to the new node' do
        expect(list.head.value).to eq(2)
      end

      it 'sets the head and tail to diferent nodes' do
        expect(list.head).not_to eq(list.tail)
      end

      it 'increments the size' do
        expect(list.size).to eq(2)
      end

      it 'sets tail next_node to nil' do
        expect(list.tail.next_node).to be_nil
      end
    end
  end

  describe '#at' do
    describe 'when the list is empty' do
      it 'returns nil' do
        expect(list.at(0)).to be_nil
      end
    end

    describe 'when the list is not empty' do
      before do
        list.append(1)
        list.append(2)
        list.append(3)
      end

      it 'returns the node at the given index' do
        expect(list.at(1).value).to eq(2)
      end

      it 'returns nil if the index is out of range' do
        expect(list.at(5)).to be_nil
      end
    end
  end

  describe '#pop' do
    describe 'when the list is empty' do
      it 'returns nil' do
        expect(list.pop).to be_nil
      end
    end

    describe 'when the list size is 1' do
      before { list.append(1) }

      it 'returns the value of the node' do
        expect(list.pop).to eq(1)
      end

      it 'sets the head and tail to nil' do
        list.pop
        expect(list.head == nil && list.tail == nil).to be(true)
      end

      it 'decrements the size' do
        list.pop
        expect(list.size).to eq(0)
      end
    end

    describe 'when the list is not empty' do
      before do
        list.append(1)
        list.append(2)
        list.append(3)
      end

      it 'returns the last node value' do
        expect(list.pop).to eq(3)
      end

      it 'sets the tail to the previous node' do
        list.pop
        expect(list.tail.value).to eq(2)
      end

      it 'sets the tail next_node to nil' do
        list.pop
        expect(list.tail.next_node).to be_nil
      end

      it 'decrements the size' do
        list.pop
        expect(list.size).to eq(2)
      end
    end
  end
end
