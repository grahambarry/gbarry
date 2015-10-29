class PictureFrame < ActiveRecord::Base
belongs_to :pins
	has_attached_file :image, :styles => { :large => "960x480>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :image, :attachment_presence => true
after_create :get_the_aspect_frame

end

  def get_the_aspect_frame()
          dimensions = Paperclip::Geometry.from_file(image.queued_for_write[:original].path)

      if
      (dimensions.width / dimensions.height >= 0.9) && (dimensions.width / dimensions.height <= 1.2)

        self.update_column(:aspect_frame, 3)

elsif
        dimensions.vertical?

        self.update_column(:aspect_frame, 2)

      else
                 dimensions.horizontal?

        self.update_column(:aspect_frame, 1)


      end
    end
