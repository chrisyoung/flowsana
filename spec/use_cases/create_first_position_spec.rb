require 'rails_helper'

describe UseCase::CreateFirstPosition do
  subject           { described_class.new(listener) }
  let(:listener)    { double(create_position_success: nil) }
  let(:flow) do
    cf = UseCase::CreateFlow.new(double(create_flow_success: nil))
    cf.create({name: "Vinyasa"})
    cf.repository.first
  end
  let(:repository)  { subject.repository }
  let(:attributes)  { { name: "Lotus", flow: flow } }

  describe "#create" do
    it 'adds the position to the repository' do
      subject.create(attributes)
      expect(repository.count).to eq 1
    end

    it 'assigns the flow first_position' do
      subject.create(attributes)
      expect(flow.first_position).to eq repository.first
    end

    it 'notifies listener of success' do
      expect(listener).to receive(:create_position_success)
      subject.create(attributes)
    end
  end
end
