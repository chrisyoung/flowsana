require 'rails_helper'

describe UseCase::CreateTransition do
  describe "#create" do
    subject           { described_class.new(listener) }
    let (:listener)   { double(create_transition_success: nil) }
    let (:repository) { subject.repository }
    let (:from)       { Position.new(  name: "Lotus"  )}
    let (:to)         { Position.new(  name: "Tadasana" )  }

    before do
      repository.clear
    end

    it 'adds the transition to the repository' do
      subject.create(from: from, to: to)
      expect(repository.count).to eq 1
    end

    it 'notifies the listener of success' do
      expect(listener).to receive(:create_transition_success)
      subject.create(from: from, to: to)
    end

    context "Positions" do
      before do
        subject.create(from: from, to: to)
      end

      it 'adds the transition to the from position' do
        expect(from.to_transitions).to include repository.first
      end

      it 'adds the transition to the to position' do
        expect(to.from_transitions).to include repository.first
      end
    end
  end
end
