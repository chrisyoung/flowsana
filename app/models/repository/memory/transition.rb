module Repository
  module Memory
    class Transition
      attr_accessor :listener

      def initialize
        @list = []
      end

      def find(transition)
        @list.first do |listed_transition|
          transition == listed_transition
        end
      end

      def all
        @listener.transition_repository_all_success(@list)
      end

      def create(attributes)
        ::Transition.new(attributes).tap do |transition|
          if transition.valid?
            @list << transition
            @listener.transition_repository_create_success(transition) if @listener
          else
            @listener.transition_repository_create_failure if @listener
          end
        end
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
