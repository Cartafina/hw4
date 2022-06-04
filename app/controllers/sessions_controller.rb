class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        # login the user
        flash["notice"] = "You've logged in."
        redirect_to "/places"
      else
        flash["notice"] = "Unsuccessful login."
        redirect_to "/login"
      end
    else
      flash["notice"] = "Unsuccessful login."
      redirect_to "/login"
    end
  end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end
end
  