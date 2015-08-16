module Repository
  module Database
    class Sequence
      def initialize(listener = nil)
        @listener = listener
        @adapter  = Repository::Adapters::AR::Sequence.new(self)
        @model    = ::Sequence
      end

      def create(attributes)
        @model.new(attributes).tap do |sequence|
          return unless sequence.valid?
          @adapter.create(sequence.attributes)
        end
      end

      def sequence_adapter_create_success(sequence)
        @listener.sequence_repository_create_success(sequence)
      end

      def list
        @listener.sequence_repository_list_success(@adapter.list)
      end

      def count
        @model.count
      end

      def update(id, attributes)
        @adapter.update(id, attributes)
      end

      def sequence_adapter_update_success(sequence)
        @listener.sequence_repository_update_success(sequence)
      end

      def first
        @adapter.first
      end

      def sequence_adapter_list_success(sequences)
        @listener.sequence_repository_list_success(sequences)
      end

      def get(id)
        @adapter.get(id)
      end

      def sequence_adapter_get_success(sequence)
        @listener.sequence_repository_get_success(sequence)
      end
    end
  end
end
