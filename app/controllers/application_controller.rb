class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # Adding devise authentication
  before_action :authenticate_user!
end
