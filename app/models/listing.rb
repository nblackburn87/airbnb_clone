class Listing < ActiveRecord::Base
  has_attached_file :download,
                    storage: :s3,
                    :s3_credentials => Proc.new{ |a| a.instance.s3_credentials }

  def s3_credentials
    {:bucket => "openhome", :access_key_id => "AWS_ID", :secret_access_key => "AWS_SECRET_KEY"}
  end

  # has_attached_file :image, :styles => { :medium => "560x", :thumb => "500x400#" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :user
  has_many :bookings

  validates :address, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true
  validates :zipcode, :presence => true
  validates :number_of_people, :presence => true
  validates :price_per_night, :presence => true
  validates :property_type, :presence => true
end
