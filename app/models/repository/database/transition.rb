module Repository
  module Database
    class Transition
      def initialize(listener)
        @adapter  = Repository::Adapters::AR::Transition.new self
        @model    = ::Transition
        @listener = listener
      end

      def create(attributes)
        @adapter.create attributes
      end

      def list(position)
        @adapter.list position
      end

      def transition_adapter_create_success(transition)
        @listener.transition_repository_create_success(transition)
      end

      def transition_adapter_list_success(transitions)
        @listener.transition_repository_list_success(transitions)
      end

      def count
        @model.count
      end

      def first
        @adapter.first
      end

      def find(id: id)
        ::Transition.new(@adapter.find(id).attributes)
      end
    end
  end
end
