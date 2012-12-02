class AddPaymentPeriodColumn < ActiveRecord::Migration
  def up
    add_column :members, :payment_period, :string, :default => "Yearly"
  end

  def down
    remove_column :members, :payment_period
  end
end
