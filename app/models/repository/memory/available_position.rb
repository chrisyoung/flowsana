module Repository
  module Memory
    class AvailablePosition
      attr_accessor :listener

      def initialize
        @list = []
      end

      def find(available_position)
        @list.first do |listed_available_position|
          available_position == listed_available_position
        end
      end

      def all
        @listener.available_position_repository_all_success(@list)
      end

      def create(attributes)
        ::AvailablePosition.new(attributes).tap do |available_position|
          if available_position.valid?
            @list << available_position
            @listener.available_position_repository_create_success(available_position) if @listener
          else
            @listener.available_position_repository_create_failure if @listener
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
