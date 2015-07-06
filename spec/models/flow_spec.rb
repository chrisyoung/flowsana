require 'rails_helper'

describe Flow do
  let(:attributes) {{name: "Vinyasa"}}
  subject { Flow.new(attributes: attributes, listener: double(flow_invalid: nil)) }

  context "validates" do
    it "#name" do
      subject.name = nil
      expect(subject.valid?).to be false
    end
  end

  describe "#name" do
    it { expect(subject.name).to eq attributes[:name] }
  end
end
