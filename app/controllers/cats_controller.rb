class CatsController < ApplicationController
  before_filter -> { @domain_driver = DomainDriven::Driver.new(self) }

  def index
    @domain_driver[:list_cats].list
  end

  def new
    @cat = Cat.new
  end

  def create
    @domain_driver[:create_cat].create(cat_attributes)
  end

  def edit
    @domain_driver[:read_cat].read(params[:id])
  end

  def update
    @domain_driver[:update_cat].update(params[:id], cat_attributes)
  end

  private

  listen_for(:list_cats_success)  { |cats| @cats = cats }
  listen_for(:create_cat_success) { |cat| redirect_to cats_path }
  listen_for(:update_cat_success) { |cat| redirect_to cats_path }
  listen_for(:read_cat_success)   { |cat| @cat = cat }

  def cat_attributes
    params.require(:cat).permit(:name)
  end
end
