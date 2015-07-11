class Pin < ActiveRecord::Base
	acts_as_votable
	belongs_to :use

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :image, :attachment_presence => true
  validates :image, dimensions: { width: 500, height: 500 }

def self.search(search)
query = "%#{search}%"
  if search
Pin.where("title like ? or description like ?", query, query,)

  else
Pin.all

  end
end




  
end