require 'rails_helper'

describe UseCase::CreateFlow do
  describe '#create' do
    subject           { described_class.new(listener, Repository::Memory::Flow.new) }
    let (:listener)   { double(create_flow_success: nil, create_flow_failure: nil) }
    let (:repository) { subject.repository }

    context "With Valid Properties" do
      let (:valid_attributes) { { name: "Vinyasa" } }

      it 'notifies listener of success' do
        expect(listener).to receive(:create_flow_success).with(a_kind_of(Flow))
        subject.create(valid_attributes)
      end

      it 'adds the flow to the repository' do
        subject.create(valid_attributes)
        expect(repository.count).to eq 1
      end
    end

    context "With Invalid Properties" do
      let (:invalid_attributes) { {} }
      it 'notifies the listener of failure' do
        expect(listener).to receive(:create_flow_failure)
        subject.create(invalid_attributes)
      end

      it 'does not add the flow to the repository' do
        subject.create(invalid_attributes)
        expect(repository.count).to eq 0
      end
    end
  end
end
