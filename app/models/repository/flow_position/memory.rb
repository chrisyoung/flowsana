module Repository
  module FlowPosition
    class Memory
      def initialize(listener:)
        @listener = listener
        @list = []
      end

      def create(attributes:)
        @list << attributes
      end

      def count
        @list.count
      end
    end
  end
end
