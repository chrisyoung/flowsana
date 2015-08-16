class TransitionsController < ApplicationController
  before_filter -> { @domain_driver = DomainDriven::Driver.new(self) }

  def edit
    @domain_driver[:get_transition].get params[:id]
  end

  def update
    @domain_driver[:update_transition].update params[:id], transition_attributes
  end

  private

  listen_for(:get_transition_success)    { |transition| @transition = transition }
  listen_for(:update_transition_success) { |transition| redirect_to edit_transition_path(transition.id) }

  def transition_attributes
    params.require(:transition).permit(:description)
  end
end
