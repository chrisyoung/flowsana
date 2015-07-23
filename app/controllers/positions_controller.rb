class PositionsController < ApplicationController
  def index
    UseCase::GetPositions.new(listener: self, repository: Repository::Database::Position.new).get
  end

  def create

    UseCase::CreatePosition.new(self, Repository::Database::Position.new).create(position_params)
  end

  def new
    @position = Position.new
  end

  def create_position_success(position)
    redirect_to positions_path
  end

  def get_positions_success(positions)
    @positions = positions
  end

  def position_params
    params.require(:position).permit(:name)
  end

end
