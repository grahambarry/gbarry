class PasswordResetsController < ApplicationController
  before_action :get_use,         only: [:edit, :update]
  before_action :valid_use,       only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @use = Use.find_by(email: params[:password_reset][:email].downcase)
    if @use
      @use.create_reset_digest
      @use.send_password_reset_email
      flash.now[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def edit
  end

  def update
    if params[:use][:password].empty?
      flash.now[:danger] = "Password can't be empty"
      render 'edit'
    elsif @use.update_attributes(use_params)
      log_in @use
      flash.now[:success] = "Password has been reset."
      redirect_to @use
    else
      render 'edit'
    end
  end

  private

    def use_params
      params.require(:use).permit(:password, :password_confirmation)
    end

    # Before filters

    def get_use
      @use = Use.find_by(email: params[:email])
    end

    # Confirms a valid user.
    def valid_use
      unless (@use && @use.activated? && @use.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end

    # Checks expiration of reset token.
    def check_expiration
      if @use.password_reset_expired?
        flash.now[:danger] = "Password reset has expired."
        redirect_to new_password_reset_url
      end
    end
end