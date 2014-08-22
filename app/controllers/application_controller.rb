class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def access_denied(exception)
    redirect_to root_path
  end
end
