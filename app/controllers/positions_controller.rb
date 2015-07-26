class PositionsController < ApplicationController
  def index
    UseCase::GetPositions.new(self, position_repository).all
  end

  def create
    UseCase::CreatePosition.new(self, position_repository).create(position_params)
  end

  def edit
    UseCase::GetPosition.new(self, position_repository).get(params[:id])
    UseCase::GetPositions.new(self, position_repository).all
    UseCase::ListTransitionsFor.new(self, transition_repository).list(@position)
  end

  def new
    @position = Position.new
  end

  def update
    UseCase::GetPosition.new(self, position_repository).get(params[:id])
    UseCase::UpdatePosition.new(self, position_repository).update(@position, position_params)
  end

  def get_position_success(position)
    @position = position
  end

  def create_position_success(position)
    redirect_to positions_path
  end

  def get_positions_success(positions)
    @positions = positions
  end

  def list_transitions_for_success(transitions)
    @transitions = transitions
  end

  def update_position_success(position)
    redirect_to positions_path
  end

  private

  def position_params
    params.require(:position).permit(:name)
  end

  def position_repository
    Repository::Database::Position.new
  end

  def transition_repository
    Repository::Database::Transition.new
  end
end
