class ChangeFieldPaymentMethod < ActiveRecord::Migration
  def up
    add_column :membership_fees, :payment_method, :string
    remove_column :membership_fees, :payment_type
  end

  def down
    add_column :membership_fees, :payment_type, :string
    remove_column :membership_fees, :payment_method
  end
end
