module Repository
  module FlowPosition
    class Memory
      def initialize(listener:)
        @listener = listener
        @list = []
      end

      def create(attributes:)
        @list << ::FlowPosition.new(listener: self, attributes: attributes)
        @listener.repository_create_success
      end

      def count
        @list.count
      end
    end
  end
end
