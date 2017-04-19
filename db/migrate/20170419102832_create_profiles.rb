class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :street
      t.string :suburb
      t.string :town_city
      t.string :postcode
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
