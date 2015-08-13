require 'rails_helper'

describe UseCase::UpdateTransition do
  describe 'update' do
    subject           { described_class.new(listener, Repository::Memory::Transition.new) }
    let (:listener)   { double("update_transition listener", update_transition_success: nil, update_transition_failure: nil) }
    let (:repository) { subject.repository }

    context "With Valid Properties" do
      it 'notifies listener of success' do
        expect(listener).to receive(:update_transition_success)
        subject.update()
      end
    end

    context "With Invalid Properties" do
      it 'notifies the listener of failure'
    end
  end
end
