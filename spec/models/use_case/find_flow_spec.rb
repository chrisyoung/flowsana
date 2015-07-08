require 'rails_helper'

describe UseCase::FindFlow do
  describe "#find" do
    subject        { described_class.new(listener: listener, repository: repository) }
    let(:listener) { double(find_flow_success: nil)}
    let(:repository) {Repository::FlowMemory.new}
    let(:flow)     { repository.create(name: "Vinyasa") }

    it 'retreives a flow' do
      expect(listener).to receive(:find_flow_success).with(flow: flow, positions: [])
      subject.find(flow: flow)
    end
  end
end
