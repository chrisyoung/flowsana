require 'rails_helper'

describe UseCase::TransitionFromOnePositionToMany do
  describe 'transition' do
    subject           { described_class.new(listener, Repository::Memory::Transition.new) }
    let (:listener)   { double("transition_from_one_position_to_many listener", transition_from_one_position_to_many_success: nil, transition_from_one_position_to_many_failure: nil) }
    let (:repository) { subject.repository }

    context "With Valid Properties" do
      it 'notifies listener of success' do
        expect(listener).to receive(:transition_from_one_position_to_many_success)
        subject.transition()
      end
    end

    context "With Invalid Properties" do
      it 'notifies the listener of failure'
    end
  end
end
