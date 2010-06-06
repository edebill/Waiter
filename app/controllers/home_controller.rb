class HomeController < ApplicationController
  def index
    if user_signed_in?
      @biometrics = Biometric.where(:user_id => current_user.id)
        .order('record_date')
        .limit(14)

      now = Time.now
      @biometric = current_user.biometrics.build(:record_date => now)
    else
      render :template => "home/logged_out"
    end
  end

  # POST /home/record
  # POST /home/record.xml
  def record
    @biometric = current_user.biometrics.build(params[:biometric])

    respond_to do |format|
      if @biometric.save
        format.html { redirect_to(root_url, :notice => 'Biometric data was successfully recorded.') }
        format.xml  { render :xml => @biometric, :status => :created, :location => @biometric }
      else
        Rails.logger.debug(@biometric.errors.full_messages)
        @biometrics = current_user.biometrics(:order => 'created_at')
        format.html { render :action => "index", :alert => @biometric.errors.full_messages }
        format.xml  { render :xml => @biometric.errors, :status => :unprocessable_entity }
      end
    end
  end

end
