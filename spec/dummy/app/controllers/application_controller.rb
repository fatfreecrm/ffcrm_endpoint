class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  # Stub out authentication, so when running as an engine we get no complaints about skipping a callback that
  # doesn't exist
  def authenticate_user!
    true
  end
end
