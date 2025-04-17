class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in succesfully!'
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You are now logged out"
  end
end
