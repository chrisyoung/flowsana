require 'rails_helper'

describe UseCase::CreateSequence do
  describe 'create' do
    subject           { described_class.new(listener, Repository::Memory::Sequence.new) }
    let (:listener)   { double("create_sequence listener", create_sequence_success: nil, create_sequence_failure: nil) }
    let (:repository) { subject.repository }

    context "With Valid Properties" do
      it 'notifies listener of success' do
        expect(listener).to receive(:create_sequence_success)
        subject.create()
      end
    end

    context "With Invalid Properties" do
      it 'notifies the listener of failure'
    end
  end
end
