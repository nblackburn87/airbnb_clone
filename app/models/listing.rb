class Listing < ActiveRecord::Base

  belongs_to :user

  validates :address, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true
  validates :zipcode, :presence => true
  validates :number_of_people, :presence => true
  validates :price_per_night, :presence => true
  validates :property_type, :presence => true
end
