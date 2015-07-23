module Repository
  module Database
    class Transition
      attr_accessor :listener
      def initialize
        @adapter  = Repository::Adapters::AR::Transition
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

      def list
        @listener.transition_repository_list_success(@adapter.all)
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
