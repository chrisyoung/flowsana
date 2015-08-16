module UseCase
  class ListSequences
    attr_accessor :repository

    def initialize(listener, repository=nil)
      @listener   = listener
      @repository = (repository || Repository::Memory::Sequence).new(self)
    end

    def list
      @repository.list
    end

    def sequence_repository_list_success(sequence)
      @listener.list_sequences_success(sequence)
    end

    def sequence_repository_list_failure
      @listener.list_sequences_failure
    end
  end
end
