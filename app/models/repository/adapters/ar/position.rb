module Repository
  module Adapters
    module AR
      class Position
        def initialize
          @data = Repository::Adapters::AR::Data::Position
        end

        def find(id)
          ::Position.new(@data.find(id).attributes)
        end

        def create(attributes)
          ::Position.new(@data.create(attributes).attributes)
        end

        def all
          @data.all.map do |position|
            ::Position.new(position.attributes)
          end
        end
      end
    end
  end
end
