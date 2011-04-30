class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'

  before_filter :set_time_zone

  protected
  def set_time_zone
    Time.zone = current_user.timezone if (current_user && current_user.timezone)
  end
end
