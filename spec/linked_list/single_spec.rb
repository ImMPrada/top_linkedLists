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
end
