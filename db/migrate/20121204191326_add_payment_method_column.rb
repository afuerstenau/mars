class AddPaymentMethodColumn < ActiveRecord::Migration
  def up
    add_column :members, :payment_method, :string
  end

  def down
    remove_column :members, :payment_method
  end
end
