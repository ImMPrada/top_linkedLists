require './spec/spec_helper'

RSpec.describe LinkedList::Node do
  describe 'when initialized' do
    let(:node) { described_class.new }

    it 'has a nil value' do
      expect(node.value).to be_nil
    end

    it 'has a nil next_node' do
      expect(node.next_node).to be_nil
    end

    it 'returns a Node object' do
      expect(node).to be_a(described_class)
    end
  end

  describe 'when initialized with a value' do
    let(:node) { described_class.new(1) }

    it 'has a value' do
      expect(node.value).to eq(1)
    end

    it 'has a nil next_node' do
      expect(node.next_node).to be_nil
    end

    it 'returns a Node object' do
      expect(node).to be_a(described_class)
    end
  end
end
