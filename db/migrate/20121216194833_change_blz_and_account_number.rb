class ChangeBlzAndAccountNumber < ActiveRecord::Migration
  def up
    change_column :bank_accounts, :account_number, :string, :default => nil
    add_column :bank_accounts, :bank_code, :string
    remove_column :bank_accounts, :blz
  end

  def down
    change_column :bank_accounts, :account_number, :integer, :default => nil
    add_column :bank_accounts, :blz, :integer
    remove_column :bank_accounts, :bank_code
  end
end
