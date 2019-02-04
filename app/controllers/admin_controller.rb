class AdminController < ApplicationController
  before_action :authenticate!

  def authenticate!
    authenticate_user!
    throw(:warden) unless current_user.admin?
  end
end