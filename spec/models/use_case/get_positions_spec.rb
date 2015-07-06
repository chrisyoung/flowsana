require 'rails_helper'

describe UseCase::GetPositions do
  subject! {described_class.new(listener: listener, repository: repository)}
  let     (:listener)   { double('subject listener') }
  let     (:flow)       { Flow.new(listener: double('flow listener'), attributes: {}) }
  let     (:position)   { Position.new(listener: double('position listener'), attributes: {})}
  let     (:repository) { Repository::FlowPosition::Memory.new }

  describe "#get" do
    it "gets the flow's positions" do
      repository.create(attributes: {flow: flow, position: position})
      expect(listener).to receive(:get_positions_success).with([position])
      subject.get(flow: flow)
    end
  end
end
