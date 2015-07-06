require 'rails_helper'

describe UseCase::GetToPositions do
  subject        { described_class.new(listener) }
  let(:listener) { double }
  let(:transition) do
    Transition.new({
      from: Position.new({ name: "Lotus" }),
      to:   Position.new({ name: "Tadasana" })
    })
  end

  describe "#get" do
    it "notifies the listener of success" do
      expect(listener).to receive(:get_to_positions).with([transition.to])
      subject.get(transition.from)
    end
  end
end
