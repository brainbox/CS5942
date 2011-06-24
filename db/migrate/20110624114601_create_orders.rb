class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :item
      t.string :description
      t.float :amount
      t.integer :quantity
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
