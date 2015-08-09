module Repository
  module Database
    class Transition
      def initialize(listener = nil)
        @listener = listener
        @adapter  = Repository::Adapters::AR::Transition.new(self)
        @model    = ::Transition
      end

      def create(attributes)
        @model.new(attributes).tap do |transition|
          return unless transition.valid?
          @adapter.create!(transition.attributes).tap do |transition_data|
            transition.id = transition_data.id
            @listener.transition_repository_create_success(transition)
          end
        end
      end

      def all
        @listener.transition_repository_all_success(@adapter.all)
      end

      def count
        @model.count
      end

      def first
        @adapter.first
      end

      def get(id)
        @adapter.get(id)
      end

      def transition_adapter_get_success(transition)
        @listener.transition_repository_get_success(transition)
      end
    end
  end
end
