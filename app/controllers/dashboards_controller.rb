class DashboardsController < ApplicationController
  before_action :check_rol
  def index
    @users = User.all
  end

  private
  def check_rol
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
