class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.string :code
      t.string :pagseguro_code
      t.string :status

      t.timestamps
    end
  end
end
