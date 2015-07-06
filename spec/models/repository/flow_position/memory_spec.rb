require 'rails_helper'

describe Repository::FlowPosition::Memory do
  let (:attributes) {}
  subject { described_class.new(listener: double) }

  it '#create' do
    subject.create(attributes: attributes)
  end

  describe '#count' do
    it 'returns a count of flow positions' do
      subject.create(attributes: attributes)
      subject.count.should == 1
    end
  end
end
