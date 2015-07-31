require 'rails_helper'

describe UseCase::CreateToTransitions do
  describe 'create' do
    subject           { described_class.new(listener, Repository::Memory::Transition.new) }
    let (:listener)   { double("create_to_transitions listener", create_to_transitions_success: nil, create_to_transitions_failure: nil) }
    let (:repository) { subject.repository }

    context "With Valid Properties" do
      it 'notifies listener of success' do
        expect(listener).to receive(:create_to_transitions_success)
        subject.create()
      end
    end

    context "With Invalid Properties" do
      it 'notifies the listener of failure'
    end
  end
end
