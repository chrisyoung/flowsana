class CreateTransitions < ActiveRecord::Migration
  def change
    create_table :transitions do |t|
      t.integer :to_id
      t.integer :from_id
      t.string :description
    end
  end
end
