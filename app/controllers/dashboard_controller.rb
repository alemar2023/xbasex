class DashboardController < ActionController::Base
  before_action :authenticate_user!, except: [:index, :show]

  def user

  end
  def admin

  end

  def superadmin

  end

end