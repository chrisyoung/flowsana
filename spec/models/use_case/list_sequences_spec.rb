require 'rails_helper'

describe UseCase::ListSequences do
  describe 'list' do
    subject           { described_class.new(listener, Repository::Memory::Sequence.new) }
    let (:listener)   { double("list_sequences listener", list_sequences_success: nil, list_sequences_failure: nil) }
    let (:repository) { subject.repository }

    context "With Valid Properties" do
      it 'notifies listener of success' do
        expect(listener).to receive(:list_sequences_success)
        subject.list()
      end
    end

    context "With Invalid Properties" do
      it 'notifies the listener of failure'
    end
  end
end
