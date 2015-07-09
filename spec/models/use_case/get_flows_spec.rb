require 'rails_helper'

describe UseCase::GetFlows do
  describe "#all" do
    subject { described_class.new(listener, repository) }

    let(:listener)   { double("subject_listener") }
    let(:repository) { Repository::Memory::Flow.new }
    let(:flow)       { repository.create(name: "Vinyasa") }

    describe ".get" do
      it "responds to the listener" do
        expect(listener).to receive(:get_flows_success).with([flow])
        subject.get
      end
    end
  end
end
