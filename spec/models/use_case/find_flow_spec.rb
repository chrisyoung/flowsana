require 'rails_helper'

describe UseCase::FindFlow do
  describe "#find" do
    subject        { described_class.new(listener: listener) }
    let(:listener) { double(find_flow_success: nil)}
    let(:flow)     { Repository::FlowMemory.new.create(name: "Vinyasa") }

    it 'retreives a flow' do
      expect(listener).to receive(:find_flow_success).with(flow: flow, positions: [])
      subject.find(flow: flow)
    end
  end
end
