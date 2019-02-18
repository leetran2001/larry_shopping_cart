class CreateBillings < ActiveRecord::Migration[5.2]
  def change
    create_table :billings do |t|
      t.string :code
      t.string :payment_method
      t.string :currency
      t.integer :amount
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
