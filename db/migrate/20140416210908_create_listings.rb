class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.belongs_to :user
      t.string :type
      t.string :address
      t.string :city
      t.string :state
      t.integer :zipcode
      t.integer :number_of_people
      t.integer :price_per_night

      t.timestamps
    end
  end
end
