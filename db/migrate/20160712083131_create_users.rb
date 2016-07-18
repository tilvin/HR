class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :salary
      t.string :contact
      t.boolean :status, :default => true

      t.timestamps null: false
    end
  end
end
