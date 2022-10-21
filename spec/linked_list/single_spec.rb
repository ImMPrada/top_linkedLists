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
end
