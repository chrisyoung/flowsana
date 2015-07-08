module Repository
  module Memory
    class Transition
      def list
        @list ||= []
      end

      def create(attributes)
        ::Transition.new(attributes).tap do |transition|
          return unless transition.valid?
          list << transition
        end
      end

      def first
        list.first
      end

      def clear
        @list = []
      end

      def count
        list.count
      end
    end
  end
end
