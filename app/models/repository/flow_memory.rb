module Repository
  class FlowMemory
    delegate :create, :count, :clear, to: :@singleton
    def initialize
      @singleton = FlowMemorySingleton.instance
    end

    class FlowMemorySingleton
      include Singleton

      def list
        @list ||= []
      end

      def create(attributes)
        ::Flow.new(attributes).tap do |flow|
          return unless flow.valid?
          list << flow
        end
      end

      def clear
        @list = []
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
