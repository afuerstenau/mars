class SetDefaultForColumnPaymentPeriod < ActiveRecord::Migration
  def up
    change_column :members, :payment_period, :string, :default => nil
  end

  def down
    change_column :members, :payment_period, :string, :default => 'Yearly'
  end
end
