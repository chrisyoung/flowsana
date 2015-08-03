module Repository::Adapters::AR
  class Position
    def initialize(listener)
      @listener = listener
      @data     = Repository::Adapters::AR::Data::Position
    end

    def find(id)
      result = @data.find(id)
      @listener.position_adapter_find_success(
        ::Position.new(result.attributes).tap do |position|
          position.to_transitions = result.to_transitions
          position.from_transitions = result.from_transitions
        end
      )
    end

    def create(attributes)
      @listener.position_adapter_create_success(
        ::Position.new(@data.create(attributes).attributes))
    end

    def update(position, attributes)
      ar_position = @data.find(position.id)
      to_transitions = attributes.delete(:to_transitions)
      ar_position.update_attributes(attributes)
      @listener.position_adapter_update_success(
        ::Position.new(ar_position.attributes)
      )
    end

    def all
      @listener.position_adapter_all_success(
        @data.all.map {|position| ::Position.new(position.attributes)})
    end
  end
end
