require 'rails_helper'

describe UseCase::UpdatePosition do
  describe 'update' do
    subject           { described_class.new(listener, Repository::Memory::Position.new) }
    let (:listener)   { double("update_position listener", update_position_success: nil, update_position_failure: nil) }
    let (:repository) { subject.repository }

    context "With Valid Properties" do
      it 'notifies listener of success' do
        expect(listener).to receive(:update_position_success)
        subject.update()
      end
    end

    context "With Invalid Properties" do
      it 'notifies the listener of failure'
    end
  end
end
