class AddStartOnToOwnershipRegistrations < ActiveRecord::Migration[5.0]
  def change
    add_column :ownership_registrations, :start_on, :date
  end
end
