class AccountActivationsController < ApplicationController

  def edit
    use = Use.find_by(email: params[:email])
    if use && !use.activated? && use.authenticated?(:activation, params[:id])
      use.activate
      log_in use
      flash.now[:success] = "Account activated!"
      redirect_to use
    else
      flash.now[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end