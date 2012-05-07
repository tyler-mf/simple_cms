class AccessController < ApplicationController
  
  layout 'admin'
  
  before_filter :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  
  def index
    menu
    render('menu')
  end
  
  def menu
    
  end

  def login
    
  end
  
  def attempt_login
    autorized_user = AdminUser.authenticate(params[:username], params[:password])
    if autorized_user
      session[:user_id] = autorized_user.id
      session[:username] = autorized_user.username
      flash[:notice] = "You are logged in."
      redirect_to(:action => 'menu')
    else
      flash[:notice] = "Invalid password or username"
      redirect_to(:action => 'login')
    end
  end
  
  def logout
      session[:user_id] = nil
      session[:username] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => 'login')
  end
  

end
