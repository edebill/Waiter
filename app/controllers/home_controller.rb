class HomeController < ApplicationController
  def index
    if user_signed_in?

      @biometrics = Biometric.where(:user_id => current_user.id).order('record_date asc')

      @biometric = current_user.biometrics.build(:record_date => "now")

    else

      render :template => "home/logged_out"

    end
  end
end
