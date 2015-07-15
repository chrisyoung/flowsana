require 'rails_helper'

describe Repository::Memory::Position do

  subject { described_class.new(listener) }

  let(:listener) { double('subject_listener', repository_create_position_success: nil) }

  describe '.create' do
    it 'notifies listener of success'
  end

  describe '.read' do
    it 'notifies listener of success'
  end

  describe '.update' do
    it 'notifies listener of success'
  end

  describe '.delete' do
    it 'notifies listener of success'
  end

  describe '.count' do
    it 'returns a count of position' do
      # subject.create()
      # expect(subject.count).to eq 1
    end
  end
end
