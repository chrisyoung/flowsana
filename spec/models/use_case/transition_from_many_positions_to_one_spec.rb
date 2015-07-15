require 'rails_helper'

describe UseCase::TransitionFromManyPositionsToOne do
  describe 'transition' do
    subject           { described_class.new(listener, Repository::Memory::Transition.new) }
    let (:listener)   { double("transition_from_many_positions_to_one listener", transition_from_many_positions_to_one_success: nil, transition_from_many_positions_to_one_failure: nil) }
    let (:repository) { subject.repository }

    context "With Valid Properties" do
      it 'notifies listener of success' do
        expect(listener).to receive(:transition_from_many_positions_to_one_success)
        subject.transition()
      end
    end

    context "With Invalid Properties" do
      it 'notifies the listener of failure'
    end
  end
end
