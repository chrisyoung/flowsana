require 'rails_helper'

describe Repository::FlowPositionMemory do
  let(:flow) {double('flow')}
  let(:position) {double('position')}
  let(:attributes) {{flow: flow, position: position}}

  subject { described_class.new }

  describe '#create' do
    it 'notifies listener of success' do
      subject.create(attributes: attributes)
    end
  end

  describe '#get' do
    before do
      subject.create(attributes: attributes)
    end

    it do
      subject.get(flow: flow)
    end
  end

  describe '#count' do
    it 'returns a count of flow positions' do
      subject.clear
      subject.create(attributes: attributes)
      expect(subject.count).to eq 1
    end
  end
end