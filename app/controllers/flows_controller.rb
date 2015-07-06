class FlowsController < ApplicationController
  def new
    @flow = Flow.new
  end

  def create
    UseCase::CreateFlow.new(self, Repository::FlowDatabase).create(flow_params)
  end

  def show
    UseCase::FindFlow.new(listener: self, repository: Repository::FlowDatabase).find(id: params[:id])
  end

  ### UseCaseEvents

  def __create_flow_success(flow)
    redirect_to flow_path(id: flow.id)
  end

  def __find_flow_success(flow:, positions:)
    @flow = flow
    @positions = positions
  end

  def __flow_params
    params.require(:flow).permit(:name)
  end
end
