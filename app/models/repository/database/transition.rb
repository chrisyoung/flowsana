module Repository
  module Database
    class Transition
      def initialize(listener)
        @adapter  = Repository::Adapters::AR::Transition
        @model    = ::Transition
        @listener = listener
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

      def list(position)
        @listener.transition_repository_list_success(
          @adapter.where(from_id: position.id).map do |ar_transition|
            ::Transition.new(ar_transition.attributes)
          end
        )
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
