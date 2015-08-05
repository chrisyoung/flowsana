module Repository::Adapters::AR
  class Position
    def initialize(listener)
      @listener = listener
      @position_data           = Repository::Adapters::AR::Data::Position
    end

    def find(id)
      result = @position_data.find(id)
      @listener.position_adapter_find_success(
        ::Position.new(result.attributes).tap do |position|
          position.to_transitions = result.to_transitions
          position.from_transitions = result.from_transitions
        end
      )
    end

    def create(attributes)
      @listener.position_adapter_create_success(
        ::Position.new(@position_data.create(attributes).attributes))
    end

    def update(position, attributes)
      to_transitions = attributes.delete(:to_transitions)
      attributes[:to_transitions_attributes] = to_transitions

      ar_position = @position_data.find(position.id)
      ar_position.update_attributes(attributes)

      @listener.send(:position_adapter_update_success,
        ::Position.new(ar_position.attributes))
    end

    def all
      @listener.position_adapter_all_success(
        @position_data.all.map {|position| ::Position.new(position.attributes)})
    end
  end
end
