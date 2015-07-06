require 'rails_helper'

describe UseCase::CreatePosition do
  subject           { described_class.new(listener) }
  let(:listener)    { double(create_position_success: nil) }
  let(:repository)  { subject.repository }
  let(:attributes)  { { name: "Lotus" } }

  describe "#create" do
    it 'adds the position to the repository' do
      subject.create(attributes)
      expect(repository.count).to eq 1
    end

    it 'notifies listener of success' do
      expect(listener).to receive(:create_position_success)
      subject.create(attributes)
    end
  end
end
