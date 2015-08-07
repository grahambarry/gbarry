class PinsController < ApplicationController
		before_action :find_pin, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
    before_action :correct_use_pin,   only: [:edit, :update]


  
  def index
    @pins = Pin.paginate(page: params[:page], per_page: 6).order("created_at DESC")

	@pins = Pin.all


	
  if params[:search]
    @pins = Pin.search(params[:search]).order("created_at DESC").paginate(page: params[:page], per_page: 6)
	
  else
    @pins = Pin.paginate(page: params[:page], per_page: 6).order("created_at DESC")
    @micropost = current_use.microposts.build if logged_in?

  end
end




  

	def show

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

	    def logged_in_use
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    # Confirms the correct user.
    def correct_use_pin
      @use = Use.find(params[:id])
      redirect_to(root_url) unless current_use?(@pin.use)
    end


	def pin_params
		params.require(:pin).permit(:title, :description, :image, :aspect, :image_meta)
		
	end
	

	def find_pin
		@pin = Pin.find(params[:id])
	end
end