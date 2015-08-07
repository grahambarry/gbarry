class PictureFramesController < ApplicationController
  before_action :set_picture_frame, only: [:show, :edit, :update, :destroy]

  # GET /picture_frames
  # GET /picture_frames.json
  def index
    @picture_frames = PictureFrame.all
  end

  # GET /picture_frames/1
  # GET /picture_frames/1.json
  def show
  end

    def portrait
       @picture_frames = PictureFrame.aspect
  end

  # GET /picture_frames/new
  def new
    @picture_frame = PictureFrame.new
  end

  # GET /picture_frames/1/edit
  def edit
  end

  # POST /picture_frames
  # POST /picture_frames.json
  def create
    @picture_frame = PictureFrame.new(picture_frame_params)

    respond_to do |format|
      if @picture_frame.save
        format.html { redirect_to @picture_frame, notice: 'Picture frame was successfully created.' }
        format.json { render :show, status: :created, location: @picture_frame }
      else
        format.html { render :new }
        format.json { render json: @picture_frame.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /picture_frames/1
  # PATCH/PUT /picture_frames/1.json
  def update
    respond_to do |format|
      if @picture_frame.update(picture_frame_params)
        format.html { redirect_to @picture_frame, notice: 'Picture frame was successfully updated.' }
        format.json { render :show, status: :ok, location: @picture_frame }
      else
        format.html { render :edit }
        format.json { render json: @picture_frame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /picture_frames/1
  # DELETE /picture_frames/1.json
  def destroy
    @picture_frame.destroy
    respond_to do |format|
      format.html { redirect_to picture_frames_url, notice: 'Picture frame was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture_frame
      @picture_frame = PictureFrame.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_frame_params
      params.require(:picture_frame).permit(:name, :image_url, :image, :id, :aspect_frame, :image_meta)
    end
end
