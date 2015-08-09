require 'rails_helper'

describe UseCase::GetTransition do
  describe 'get' do
    subject           { described_class.new(listener, Repository::Memory::Transition.new) }
    let (:listener)   { double("get_transition listener", get_transition_success: nil, get_transition_failure: nil) }
    let (:repository) { subject.repository }

    context "With Valid Properties" do
      it 'notifies listener of success' do
        expect(listener).to receive(:get_transition_success)
        subject.get()
      end
    end

    context "With Invalid Properties" do
      it 'notifies the listener of failure'
    end
  end
end
