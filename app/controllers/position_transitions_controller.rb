class PositionTransitionsController < ApplicationController
  def create
    UseCase::TransitionFromManyPositionsToOne
      .new(self, repository).transition(params[:from].keys, params[:position_id])
  end

  def transition_from_many_positions_to_one_success(transitions)
    binding.pry
  end

  private

  def repository
    Repository::Database::Transition.new
  end
end
