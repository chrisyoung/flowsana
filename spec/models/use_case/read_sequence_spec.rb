require 'rails_helper'

describe UseCase::ReadSequence do
  describe 'read' do
    subject           { described_class.new(listener, Repository::Memory::Sequence.new) }
    let (:listener)   { double("read_sequence listener", read_sequence_success: nil, read_sequence_failure: nil) }
    let (:repository) { subject.repository }

    context "With Valid Properties" do
      it 'notifies listener of success' do
        expect(listener).to receive(:read_sequence_success)
        subject.read()
      end
    end

    context "With Invalid Properties" do
      it 'notifies the listener of failure'
    end
  end
end
