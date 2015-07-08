require 'rails_helper'

describe UseCase::GetPositions do
  subject { described_class.new(listener: listener, repository: repository) }
  let(:listener)   { double('subject listener') }
  let(:repository) { Repository::Memory::Position.new }
  let(:position)   { repository.create({name: "Tadasana"}) }


  describe '#get' do
    it 'notifies the listener' do
      expect(listener).to receive(:get_positions_success).with([position])
      subject.get
    end
  end
end
