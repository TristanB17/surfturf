class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
    end
  end
end
