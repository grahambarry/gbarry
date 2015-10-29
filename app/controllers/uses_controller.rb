class UsesController < ApplicationController
  before_action :logged_in_use, only: [:index, :edit, :update]
    before_action :correct_use,   only: [:edit, :update]
    before_action :admin_use,     only: :destroy
    
def to_key
new_record? ? nil : [ self.send(self.class.primary_key) ]
end   

  def index
    @uses = Use.paginate(page: params[:page], per_page: 25).order("created_at DESC")

  @uses = Use.all

  
  if params[:search]
    @uses = Use.search(params[:search]).order("created_at DESC").paginate(page: params[:page], per_page: 25)
  
  else
    @uses = Use.paginate(page: params[:page], per_page: 25).order("created_at DESC")

  end
end

  def show
    @use = Use.find(params[:id])
     @microposts = current_use.microposts.build if logged_in?
    @microposts = @use.microposts.paginate(page: params[:page])
    
  end

  def new
  	@use = Use.new
  end

  def create
    @use = Use.new(use_params)
    if @use.save
      @use.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end


  def edit
    @use = Use.find(params[:id])
  end

    def update
    @use = Use.find(params[:id])
    if @use.update_attributes(use_params)
      # Handle a successful update.
            flash[:success] = "Profile updated"
      redirect_to @use
    else
      render 'edit'
    end
  end

    def destroy
    Use.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to uses_url
  end

  private

    def use_params
      params.require(:use).permit(:name, :email, :password, :password_confirmation)
    end

    # Confirms the correct user.
    def correct_use
      @use = Use.find(params[:id])
      redirect_to(root_url) unless current_use?(@use)
    end
end

    # Confirms an admin user.
    def admin_use
      redirect_to(root_url) unless current_use.admin?
    end
