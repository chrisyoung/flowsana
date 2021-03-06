require 'rails_helper'

describe Repository::Memory::FlowPosition do
  let(:flow) {double('flow')}
  let(:position) {double('position')}
  let(:listener) { double('subject_listener', repository_create_flow_position_success: nil) }

  subject { described_class.new(listener) }

  describe '#create' do
    it 'notifies listener of success' do
      subject.create(flow: flow, position: position)
    end
  end

  describe '#get' do
    before do
      subject.create(flow: flow, position: position)
    end

    it do
      subject.get(flow: flow)
    end
  end

  describe '#count' do
    it 'returns a count of flow positions' do
      subject.clear
      subject.create(flow: flow, position: position)
      expect(subject.count).to eq 1
    end
  end
end
