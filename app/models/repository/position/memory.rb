module Repository
  module Position
    attr_accessor :list
    class Memory
      def initialize(listener)
        @listener = listener
        @list     = []
      end

      def create(attributes)
        ::Position.new(listener: self, attributes: attributes).valid?
      end

      def position_valid(position)
        @list << position
        @listener.repository_create_success(position)
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
