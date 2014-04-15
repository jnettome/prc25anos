class CreateOrderNotifications < ActiveRecord::Migration
  def change
    create_table :order_notifications do |t|
      t.integer :order_id
      t.string :code
      t.string :status
      t.string :payment_method
      t.text :client
      t.text :address

      t.timestamps
    end
  end
end
