class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user
      if @user["password"] == params["password"]
        # login the user
        redirect_to "/companies"
      else
        redirect_to "/sessions/new"
      end
    else
      redirect_to "/sessions/new"
    end
  end

  def destroy
  end
end
  