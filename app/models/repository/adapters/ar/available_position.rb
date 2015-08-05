module Repository::Adapters::AR
  class AvailablePosition
    def initialize(listener)
      @listener = listener
      @data     = Repository::Adapters::AR::Data::AvailablePosition
    end

    def find(id)
      @listener.available_position_adapter_find_success(
        ::Position.new(@data.find(id).attributes))
    end

    def create(attributes)
      @listener.available_position_adapter_create_success(
        ::Position.new(@data.create(attributes).attributes))
    end

    def all(position)
      @listener.available_position_adapter_all_success(
        @data.excluding_positions([position] + position.to_positions).map {|available_position| ::Position.new(available_position.attributes)},
        @data.excluding_positions([position] + position.from_positions).map {|available_position| ::Position.new(available_position.attributes)}
      )
    end
  end
end
