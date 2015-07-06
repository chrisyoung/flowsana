module Repository
  module Flow
    class Memory
      def initialize(listener)
        @listener = listener
        @list     = []
      end

      def create(attributes)
        ::Flow.new(listener: self, attributes: attributes).valid?
      end

      def flow_valid(model)
        @list << model
        @listener.repository_create_success
      end

      def flow_invalid(model)
        @listener.repository_create_failure
      end

      def count
        @list.count
      end

      def first
        @list.first
      end
    end
  end
end
