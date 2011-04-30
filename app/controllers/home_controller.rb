class HomeController < ApplicationController
  def index
    if user_signed_in?

      @biometrics = Biometric.where(:user_id => current_user.id).order('record_date asc')

      @biometric = current_user.biometrics.build()

      @events =  Event.where(:user_id => current_user.id).order('event_date desc')
      @event = current_user.events.build()
    else

      render :template => "home/logged_out"

    end
  end
end
