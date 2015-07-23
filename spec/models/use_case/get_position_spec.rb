require 'rails_helper'

describe UseCase::GetPosition do
  describe 'get' do
    subject           { described_class.new(listener, Repository::Memory::Position.new) }
    let (:listener)   { double("get_position listener", get_position_success: nil, get_position_failure: nil) }
    let (:repository) { subject.repository }

    context "With Valid Properties" do
      it 'notifies listener of success' do
        expect(listener).to receive(:get_position_success)
        subject.get()
      end
    end

    context "With Invalid Properties" do
      it 'notifies the listener of failure'
    end
  end
end
