require 'rails_helper'

describe Repository::FlowPositionMemory do
  let(:flow) {double('flow')}
  let(:position) {double('position')}
  let(:attributes) {{flow: flow, position: position}}
  let(:listener) { double('subect_listener', repository_create_success: nil, repository_get_success: nil) }

  subject { described_class.new(listener: listener) }

  describe '#create' do
    it 'notifies listener of success' do
      expect(listener).to receive(:repository_create_success)
      subject.create(attributes: attributes)
    end
  end

  describe '#get' do
    before do
      subject.create(attributes: attributes)
    end

    it do
      expect(listener).to receive(:repository_get_success).with(positions: [position])
      subject.get(flow: flow)
    end
  end

  describe '#count' do
    it 'returns a count of flow positions' do
      subject.create(attributes: attributes)
      expect(subject.count).to eq 1
    end
  end
end
