class ChangeListingsTypeName < ActiveRecord::Migration
  def change
    rename_column :listings, :type, :property_type
  end
end
