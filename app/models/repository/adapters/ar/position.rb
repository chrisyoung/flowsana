module Repository::Adapters::AR
  class Position
    def initialize(listener)
      @listener = listener
      @data = Repository::Adapters::AR::Data::Position
    end

    def find(id)
      @listener.position_adapter_find_success(
        ::Position.new(@data.find(id).attributes)
      )
    end

    def create(attributes)
      @listener.position_adapter_create_success(
        ::Position.new(@data.create(attributes).attributes)
      )
    end

    def all
      @listener.position_adapter_all_success(
        @data.all.map {|position| ::Position.new(position.attributes)}
      )
    end
  end
end
