class PinsController < ApplicationController
		before_action :find_pin, only: [:show, :edit, :update, :destroy, :upvote, :downvote]



  
  def index
    @pins = Pin.paginate(page: params[:page], per_page: 6).order("created_at DESC")
	    respond_to do |format|
	    format.html
	    format.js # add this line for your js template

  if params[:search]
    @pins = Pin.search(params[:search]).order("created_at DESC").paginate(page: params[:page], per_page: 9)

  else
    @pins = Pin.paginate(page: params[:page], per_page: 9).order("created_at DESC")
    @microposts = current_use.microposts.build if logged_in?
  end
end
end







  def home
    @pins = Pin.where(:use_id => current_use.id).paginate(:page => params[:page])
    if signed_in?
      @micropost  = current_use.microposts.build
      @feed_items = current_use.feed.paginate(page: params[:page])
  end
end







  

	def show
		@pins = Pin.all
@picture_frames = PictureFrame.all
    @microposts = current_use.microposts.build if logged_in?
	end

	def new
		@pin = current_use.pins.build

	end




	def create
		@pin = current_use.pins.build(pin_params)
		if @pin.save
			redirect_to @pin, notice: "Art successfully created"
		else
			render 'new'
		end
	end

	

	def edit

	end

	def update
		if @pin.update(pin_params)
			redirect_to @pin, notice: "Successfully updated"
		else
			render 'edit'
		end
	end

	def destroy
		@pin.destroy
		redirect_to root_path
	end

	def upvote
		if logged_in?
		@pin.upvote_by current_use
		redirect_to :back
else
		
		redirect_to (login_path)
end
		
	end

private

def pin_params
		params.require(:pin).permit(:title, :description, :image, :aspect, :image_meta)
end
	

	def find_pin
		@pin = Pin.find(params[:id])
end

end


