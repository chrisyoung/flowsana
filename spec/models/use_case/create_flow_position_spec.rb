require 'rails_helper'

describe UseCase::CreateFlowPosition do

  let (:listener)   { double("subject_listener",
    create_flow_position_success: nil) }

  subject { described_class.new(listener: listener) }
  let (:flow)       { ::Flow.new({})}
  let (:position)   { ::Position.new({})}
  let (:repository) { subject.repository }


  describe '#create' do
    it 'adds to the repository' do
      repository.clear
      subject.create(flow: flow, position: position)
      expect(repository.count).to eq 1
    end

    it 'notifies the listener of success' do
      expect(listener).to receive(:create_flow_position_success)
      subject.create(flow: flow, position: position)
    end
  end
end
