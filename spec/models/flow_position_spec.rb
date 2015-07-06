require 'rails_helper'

describe FlowPosition do
  let (:listener) {double('subject_listener')}
  let (:flow)     { Flow.new(listener: double, attributes: {}) }
  let (:position) { Position.new(listener: double, attributes: {}) }
  let (:attributes) { {flow: flow, position: position} }
  subject {FlowPosition.new(listener: listener, attributes: attributes)}

  describe("#flow") do
    it {expect(subject.flow).to eq (attributes[:flow])}
  end

  describe("#position") do
    it {expect(subject.position).to eq (attributes[:position])}
  end
end
