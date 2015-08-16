class SequencesController < ApplicationController
  before_filter -> { @use_case = Rhag::UseCase.new(self) }

  def index
    @use_case[:list_sequences].list
  end

  listen_for(:list_sequences_success) {|repositories| @repositories = repositories}
end
