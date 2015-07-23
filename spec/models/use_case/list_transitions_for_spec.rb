require 'rails_helper'

describe UseCase::ListTransitionsFor do
  describe 'list' do
    subject           { described_class.new(listener, Repository::Memory::Transition.new) }
    let (:listener)   { double("list_transitions_for listener", list_transitions_for_success: nil, list_transitions_for_failure: nil) }
    let (:repository) { subject.repository }

    context "With Valid Properties" do
      it 'notifies listener of success' do
        expect(listener).to receive(:list_transitions_for_success)
        subject.list()
      end
    end

    context "With Invalid Properties" do
      it 'notifies the listener of failure'
    end
  end
end
