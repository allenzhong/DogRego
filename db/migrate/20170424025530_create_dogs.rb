class CreateDogs < ActiveRecord::Migration[5.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.datetime :date_of_birth
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
