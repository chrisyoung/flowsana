class PositionsController < ApplicationController
  listen_for(:get_position_success)         { |position| @position = position }
  listen_for(:create_position_success)      { |position| redirect_to positions_path }
  listen_for(:get_positions_success)        { |positions| @positions = positions }
  listen_for(:list_transitions_for_success) { |transitions| @transitions = transitions }
  listen_for(:update_position_success)      { |position| redirect_to positions_path }

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

  private

  def position_params
    params.require(:position).permit(:name)
  end

  def position_repository
    Repository::Database::Position
  end

  def transition_repository
    Repository::Database::Transition.new
  end
end
