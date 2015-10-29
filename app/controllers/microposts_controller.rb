class MicropostsController < ApplicationController

	before_action :logged_in_use, only: [:create, :destroy]
   before_action :correct_use,   only: :destroy

  def create
    @micropost = current_use.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'pins_path'
    end
  end

 def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

private

    def micropost_params
      params.require(:micropost).permit(:content)
    end

     def correct_use
      @micropost = current_use.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
