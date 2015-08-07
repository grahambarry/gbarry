class MicropostsController < ApplicationController
	before_action :logged_in_use, only: [:create, :destroy]

  def create
    @micropost = current_use.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render 'pins_path'
    end
  end

  def destroy
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
end
