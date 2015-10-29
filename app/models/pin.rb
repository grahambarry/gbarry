class Pin < ActiveRecord::Base

  acts_as_votable
	belongs_to :use

# This is where you set what imagemagick will resize your variants to
	has_attached_file :image, :styles => { :large => "960x960>", :medium => "300x300>", :thumb => "100x100>" },
  :storage => :s3,
            :bucket  => ENV['MY_BUCKET_NAME'],
            :s3_credentials => {
                    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
                },
                :s3_permissions => 'private',
                :url => ":s3_domain_url"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :image, :attachment_presence => true
  validates :image, dimensions: { width: 700, height: 500 }
after_create :get_the_aspect

  





def self.search(search)
query = "%#{search}%"
  if search
Pin.where("title like ? or description like ?", query, query,)

  else
Pin.all
  end
end

  def get_the_aspect()
          dimensions = Paperclip::Geometry.from_file(image.queued_for_write[:original].path)

      if
      dimensions.width / dimensions.height >= 0.8 && dimensions.width / dimensions.height <= 1.2

        self.update_column(:aspect, 3)

elsif
        dimensions.vertical?

        self.update_column(:aspect, 2)

      else
                 dimensions.horizontal?

        self.update_column(:aspect, 1)


      end
    end
  end








