require 'rails_helper'

describe UseCase::GetFlowPositions do
  subject { described_class.new(listener: listener, repository: repository) }
  let     (:listener)      { double('subject listener') }
  let     (:flow)          { Flow.new({}) }
  let     (:position)      { Position.new({}) }
  let     (:repository)    { Repository::Memory::FlowPosition.new }
  let!    (:flow_position) { repository.create(flow: flow, position: position) }

  describe "#get" do
    it "gets the flow's positions" do
      expect(listener).to receive(:get_positions_success).with([position])
      subject.get(flow: flow)
    end
  end
end
