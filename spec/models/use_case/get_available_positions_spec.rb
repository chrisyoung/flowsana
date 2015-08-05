require 'rails_helper'

describe UseCase::GetAvailablePositions do
  describe 'get' do
    subject           { described_class.new(listener, Repository::Memory::Available Position.new) }
    let (:listener)   { double("get_available_positions listener", get_available_positions_success: nil, get_available_positions_failure: nil) }
    let (:repository) { subject.repository }

    context "With Valid Properties" do
      it 'notifies listener of success' do
        expect(listener).to receive(:get_available_positions_success)
        subject.get()
      end
    end

    context "With Invalid Properties" do
      it 'notifies the listener of failure'
    end
  end
end
