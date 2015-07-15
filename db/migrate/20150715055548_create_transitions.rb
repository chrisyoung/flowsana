class CreateTransitions < ActiveRecord::Migration
  def change
    create_table :transitions do |t|
      t.integer :from_id
      t.integer :to_id
      t.string :name
      t.string :description
    end
  end
end
