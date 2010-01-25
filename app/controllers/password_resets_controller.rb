class PasswordResetsController < ApplicationController
  
  before_filter :load_user_using_perishable_token, :only => [:edit, :update]
  before_filter :current_user

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user
      @user.deliver_password_reset_instructions!  
      flash[:notice] = t('flash.password.reset_delivered')
      redirect_to root_url
    else
      flash[:notice] = t('flash.password.email_unknown')
      render :action => :new  
    end  
  end

  def edit
  end

  def update
    @user.password = params[:user][:password]
    if @user.save
      flash[:notice] = t("flash.password.success")
      redirect_to login_url
    else
      render :action => :edit
    end
  end

private

  def load_user_using_perishable_token
    @user = User.find_using_perishable_token(params[:id])
    unless @user
      flash[:notice] = t("flash.password.perishable_token_unknown")
      redirect_to root_url
    end
  end

end