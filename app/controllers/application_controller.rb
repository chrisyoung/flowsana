class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def repository
    Repository::Database
  end

  def self.listen_for(message, &block)
    send :define_method, message, &block
  end


end
