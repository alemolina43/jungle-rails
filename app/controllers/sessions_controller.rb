class SessionsController < ApplicationController

  def create
    user = User.authenticate_with_credentials(params[:email], params[:password])
    # If the user exists AND the password entered is correct.
    if user 
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in succesfully!'
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to login_path, notice: 'Invalid email or password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You are now logged out"
  end
end
