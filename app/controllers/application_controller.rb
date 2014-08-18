class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def access_denied
    redirect_to root_path
  end
end
