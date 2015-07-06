require 'rails_helper'

describe Repository::FlowPosition::Memory do
  let (:attributes) {}
  subject { described_class.new(listener: double('subect_listener', repository_create_success: nil)) }

  it '#create' do
    subject.create(attributes: attributes)
  end

  describe '#count' do
    it 'returns a count of flow positions' do
      subject.create(attributes: attributes)
      expect(subject.count).to eq 1
    end
  end
end
