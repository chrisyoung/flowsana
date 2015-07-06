module Repository
  class PositionMemory
    delegate :create, :count, to: :@singleton
    def initialize
      @singleton = PositionMemorySingleton.instance
    end

    class PositionMemorySingleton
      include Singleton

      def list
        @list ||= []
      end

      def clear
        @list = []
      end

      def create(attributes)
        ::Position.new(attributes).tap do |position|
          return unless position.valid?
          list << position
        end
      end

      def count
        list.count
      end

      def first
        list.first
      end
    end
  end
end
