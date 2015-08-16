module Repository
  module Memory
    class Sequence
      attr_accessor :listener

      def initialize
        @list = []
      end

      def find(sequence)
        @list.first do |listed_sequence|
          sequence == listed_sequence
        end
      end

      def all
        @listener.sequence_repository_all_success(@list)
      end

      def create(attributes)
        ::Sequence.new(attributes).tap do |sequence|
          if sequence.valid?
            @list << sequence
            @listener.sequence_repository_create_success(sequence) if @listener
          else
            @listener.sequence_repository_create_failure if @listener
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
