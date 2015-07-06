require 'rails_helper'

describe UseCase::CreateFlowPosition do
  subject { described_class.new(listener: double) }
  let (:flow) { ::Flow.new( attributes: {}, listener: double )}
  let (:position) { ::Position.new( attributes: {}, listener: double )}
  let (:repository) { subject.repository }

  let (:attributes) { { flow: flow, position: position } }
  describe '#create' do
    it 'adds to the repository' do
      subject.create(attributes)
      expect(repository.count).to eq 1
    end
  end
end
