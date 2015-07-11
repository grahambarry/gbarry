class PinsController < ApplicationController

  
  def index
    @pins = Pin.paginate(page: params[:page], per_page: 6).order("created_at DESC")

	@pins = Pin.all

	
  if params[:search]
    @pins = Pin.search(params[:search]).order("created_at DESC").paginate(page: params[:page], per_page: 6)
	
  else
    @pins = Pin.paginate(page: params[:page], per_page: 6).order("created_at DESC")

  end
end


  

	def show
	end

	def new
		@pin = current_use.pins.build
	end

	def create
		@pin = current_user.pins.build(pin_params)

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
		@pin.upvote_by current_user
		redirect_to :back
	end

	private

	def pin_params
		params.require(:pin).permit(:title, :description, :image)
	end
	

	def find_pin
		@pin = Pin.find(params[:id])
	end
end