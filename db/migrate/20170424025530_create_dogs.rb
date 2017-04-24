class CreateDogs < ActiveRecord::Migration[5.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.date :date_of_birth_on
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
