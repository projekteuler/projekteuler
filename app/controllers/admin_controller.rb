class AdminController < ApplicationController
  before_action :authenticate!

  def authenticate!
    authenticate_user!
    raise SecurityError unless current_user.admin?
  end
end