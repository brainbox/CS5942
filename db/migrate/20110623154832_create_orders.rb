class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :number
      t.float :shipping
      t.date :date
      t.string :count
      t.string :field

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
