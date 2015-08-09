class TransitionsController < ApplicationController
  before_filter -> { @use_case = Rhag::UseCase.new(self) }
  def edit
    @use_case[:get_transition].get params[:id]
  end

  private

  listen_for(:get_transition_success) { |transition| }
end
