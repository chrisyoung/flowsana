require 'rails_helper'

describe UseCase::UpdateSequence do
  describe 'update' do
    subject           { described_class.new(listener, Repository::Memory::Sequence.new) }
    let (:listener)   { double("update_sequence listener", update_sequence_success: nil, update_sequence_failure: nil) }
    let (:repository) { subject.repository }

    context "With Valid Properties" do
      it 'notifies listener of success' do
        expect(listener).to receive(:update_sequence_success)
        subject.update()
      end
    end

    context "With Invalid Properties" do
      it 'notifies the listener of failure'
    end
  end
end
