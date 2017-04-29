class CreateOwnershipRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :ownership_registrations do |t|
      t.integer :duration
      t.boolean :paid
      t.boolean :email_sent
      t.references :dog, foreign_key: true

      t.timestamps
    end
  end
end
