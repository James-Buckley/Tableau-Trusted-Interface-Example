class ApplicationController < ActionController::Base
  protect_from_forgery
  def current_user
    session[:current_user]
  end
  helper_method :current_user

  def login
    if params[:login] && params[:login][:username] && params[:login][:username].present?
      session[:current_user] = params[:login][:username]
      redirect_to iframe_reports_path
    else
      flash[:error] = "You must specify a username to log in"
      redirect_to reports_url
    end
  end

  def logout
    session[:current_user] = nil
    redirect_to reports_path
  end
end
