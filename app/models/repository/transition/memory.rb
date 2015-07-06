module Repository
  module Transition
    class Memory
      attr_accessor :list
      def initialize(listener)
        @listener = listener
        @list     = []
      end

      def create(attributes)
        ::Transition.new(self, attributes).valid?
      end

      def transition_valid(transition)
        @list << transition
        @listener.repository_create_success
      end

      def first
        @list.first
      end

      def count
        @list.count
      end
    end
  end
end
