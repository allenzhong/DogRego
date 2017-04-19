class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :suburb
      t.string :town_city
      t.string :postcode
      t.string :country
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
