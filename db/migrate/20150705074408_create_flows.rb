class CreateFlows < ActiveRecord::Migration
  def change
    create_table :flows do |t|
      t.string :name
    end
  end
end
