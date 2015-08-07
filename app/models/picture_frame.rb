class PictureFrame < ActiveRecord::Base
belongs_to :pins
	has_attached_file :image, :styles => { :large => "960x480>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :image, :attachment_presence => true

  def Portrait
  	PictureFrameP.where(aspect_frame: '2').take!
end	

  def Landscape
  	PictureFrameL.where(aspect_frame: '1').take!
end	
end