module Repository
  module Database
    class AvailablePosition
      def initialize(listener = nil)
        @listener = listener
        @adapter  = Repository::Adapters::AR::AvailablePosition.new(self)
        @model    = ::AvailablePosition
      end

      def create(attributes)
        @model.new(attributes).tap do |available_position|
          return unless available_position.valid?
          @adapter.create!(available_position.attributes).tap do |available_position_data|
            available_position.id = available_position_data.id
            @listener.available_position_repository_create_success(available_position)
          end
        end
      end

      def all(position)
       @adapter.all(position)
      end

      def available_position_adapter_all_success(to_positions, from_positions)
         @listener.available_position_repository_all_success(to_positions, from_positions)
      end

      def count
        @model.count
      end

      def first
        @adapter.first
      end

      def find(id: id)
        ::AvailablePosition.new(@adapter.find(id).attributes)
      end
    end
  end
end
