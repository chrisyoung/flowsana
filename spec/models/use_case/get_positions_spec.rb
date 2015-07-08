require 'rails_helper'

describe UseCase::GetPositions do
  let(:listener) { double }
  let(:repository) {Repository::PositionMemory.new}
  let(:position)  { repository.create({name: "Tadasana"}) }
  subject        { described_class.new(listener: listener, repository: repository) }

  describe '#get' do
    it 'notifies the listener' do
      expect(listener).to receive(:get_positions_success).with([position])
      subject.get
    end
  end
end
